import * as chokidar from 'chokidar';
import * as crypto from 'crypto';
import * as fs from 'fs';
import glob from 'glob';
import sizeOf from "image-size";
import * as path from 'path';
import { PNG } from 'pngjs';
import TGA from 'tga';
import { debounce } from 'ts-debounce';
import { promisify } from 'util';
import * as vscode from 'vscode';
import { Configuration } from './configuration';
import { assets as skinningAssets } from './SkinDataProvider';
const readFileAsync = promisify(fs.readFile);
const existsAsync = promisify(fs.exists);
const statAsync = promisify(fs.stat);

async function findAsyncSequential<T>(
    array: T[],
    predicate: (t: T) => Promise<boolean>,
): Promise<T | undefined> {
    for (const t of array) {
        if (await predicate(t)) {
            return t;
        }
    }
    return undefined;
}

export interface Image {
    uri: vscode.Uri;
    ext: string;
    width?: number;
    height?: number;
    cachedUri?: vscode.Uri;
    lastmodified: number;
    description?: string;
}
const IMAGE_EXTENSIONS = [ 'jpg', 'png', 'tga' ];

export class ImageProvider {

    private _workflowPluginRoots: Map<string, Set<string>>;
    private _tempFileImages: string[];
    private _imageCache: Map<string, Image>;
    private _disposables: vscode.Disposable[] = [];

    constructor(folders: readonly vscode.WorkspaceFolder[] | undefined, protected _tempDir: string) {
        this._workflowPluginRoots = new Map<string, Set<string>>();
        this._imageCache = new Map<string, Image>();
        this._tempFileImages = [];
        
        const skinningAssetPath = Configuration.skinningAssetsPath();
        fs.mkdirSync(this._tempDir, { recursive: true });

        // Monitor all plugin files being added or removed from workspaces
        if (folders === undefined) return;
        folders.forEach(f => {
            if (skinningAssetPath && skinningAssetPath.startsWith(f.uri.fsPath)) {
                return;
            }
            const watcher = chokidar.watch(path.join(f.uri.fsPath, '**/*.plugin'), {
                persistent: true,
                depth: 5
            });
            this._disposables.push({ dispose: () => { 
                watcher.close(); 
            } });
            const debouncedRWPR = debounce((folder: string) => this.rebuildWorkspacePluginRoots(folder), 300, {});
            watcher.on('all', (event) => {
                if (/^(add|unlink)$/.test(event)) {
                    debouncedRWPR(f.uri.fsPath);
                }
            });
        });
    }

    dispose() {
        this._tempFileImages.forEach(f => fs.unlinkSync(f));
        while (this._disposables.length) {
			const x = this._disposables.pop();
			if (x) x.dispose();
		}
    }

    // Build distinct list of parent plugin folders
    private rebuildWorkspacePluginRoots(workspaceFolder: string) {
        glob(path.join(workspaceFolder, '**/*.plugin'), {}, (err, files) => {
            const roots = new Set<string>();
            (files || []).map(f => path.dirname(f)).map(f => path.dirname(f)).forEach(f => roots.add(f));
            this._workflowPluginRoots.set(workspaceFolder, roots);
        });
    }

    public async createPngFromTga(tga: TGA, outFile: string): Promise<PNG> {
        var png = new PNG({
            width: tga.header.width,
            height: tga.header.height
        });
        png.data = Buffer.from(tga.pixels);
        const out = fs.createWriteStream(outFile);
        png.pack().pipe(out);

        const end = new Promise(function (resolve, reject) {
            out.on('finish', () => resolve(outFile));
            out.on('error', reject);
        });
        await end;
        return png;
    }

    public async findImageById(imageId: string): Promise<Image | undefined> {

        let image = this._imageCache.get(imageId);
        if (image) return image;

        try {
            if (!/^0x/.test(imageId)) {
                imageId = `0x${imageId}`;
            }

            const asset = skinningAssets[imageId];
            if (!asset) return;

            const skinningAssetPath = Configuration.skinningAssetsPath();
            if (!skinningAssetPath) return;
            let imagePathBase = path.join(skinningAssetPath, asset.n);
            const imagePath = await findAsyncSequential<string>(IMAGE_EXTENSIONS.map(ext => `${imagePathBase}.${ext}`), async (p) => await existsAsync(p));
            if (!imagePath) return;
            
            let image: Image = {
                uri: vscode.Uri.from({ scheme: 'file', path: imagePath }),
                lastmodified: 0,
                description: asset.n,
                ext: path.extname(imagePath)
            };
            if (/\.tga$/.test(imagePath)) {
                const buf = await readFileAsync(imagePath);
                const tga = new TGA(buf);
                if (!tga) return;
                const keepConvertedAssets = Configuration.keepConvertedAssets();
                const tmpFile = keepConvertedAssets ? `${imagePathBase}.png` : path.join(this._tempDir, imageId + ".png");
                if (keepConvertedAssets) this._tempFileImages.push(tmpFile);
                const png = await this.createPngFromTga(tga, tmpFile);
                image.cachedUri = vscode.Uri.from({ scheme: 'file', path: tmpFile });
                image.width = png.width;
                image.height = png.height;
            } else {
                const size = sizeOf(await readFileAsync(imagePath));
                image.width = size.width;
                image.height = size.height;
            }

            this._imageCache.set(imageId, image);
            return image;
        } catch (ex) { console.error(ex); }

    }

    public async findImageForWorkspace(document: vscode.TextDocument, file: string): Promise<Image | undefined> {
        const paths = [path.dirname(document.fileName)];

        // if we have a workspace.. add it to the list of paths we try
        const workspace = vscode.workspace.getWorkspaceFolder(document.uri);
        if (workspace) {
            this._workflowPluginRoots.get(workspace.uri.fsPath)?.forEach(p => paths.push(p));
        }

        // find which one has a match
        const imagePath = await findAsyncSequential<string>(paths.map(p => path.resolve(p, file)), async (p) => await existsAsync(p));
        if (!imagePath) return;

        const stats = await statAsync(imagePath);
        let image = this._imageCache.get(imagePath);
        if (image && stats.mtimeMs === image.lastmodified) {
            return image;
        }

        const ext = path.extname(imagePath);
        image = {
            uri: vscode.Uri.from({ scheme: 'file', path: imagePath }),
            lastmodified: stats.mtimeMs,
            ext
        };

        if (ext === '.tga') {
            try {
                const hash = crypto.createHash('sha256').update(imagePath, 'utf8').digest('hex');
                const tmpFile = path.join(this._tempDir, hash + ".png");
                this._tempFileImages.push(tmpFile);

                const png = await this.createPngFromTga(new TGA(await readFileAsync(imagePath)), tmpFile);

                image.cachedUri = vscode.Uri.from({ scheme: 'file', path: tmpFile });
                image.width = png.width;
                image.height = png.height;
                this._imageCache.set(imagePath, image);
                return image;
            } catch (ex) { }

        } else {
            const size = sizeOf(await readFileAsync(imagePath));
            image.width = size.width;
            image.height = size.height;
            this._imageCache.set(imagePath, image);
            return image;
        }

    }

    public getResourceRoots(): vscode.Uri[] {
        const roots = [
            vscode.Uri.from({ scheme: 'file', path: this._tempDir })
        ];
        
        const skinningAssetPath = Configuration.skinningAssetsPath();
        if (skinningAssetPath) {
            roots.push(vscode.Uri.from({ scheme: 'file', path: skinningAssetPath }));
        }
        vscode.workspace.workspaceFolders?.forEach(f => roots.push(f.uri));
        return roots;
    }

}

const REGEX_LUA = /(?<=["'])(.+?\.(jpg|jpeg|tga|png))(?=["'])|(?<=(SetBackground|Graphic)\()(0x[0-9A-F]{8}|\d{9,})(?=\))/i;
const REGEX_SKIN = /(?<=<Mapping.*FileName\s*=\s*["'])(.+?\.(jpg|jpeg|tga|png))(?=["'])/i;
const REGEX_PLUGIN = /(?<=<Image>)(.+?\.(jpg|jpeg|tga|png))(?=<\/Image>)/i;

export class LotroImageHoverProvider implements vscode.HoverProvider {

    private _imageProvider: ImageProvider;

    constructor(imageProvider: ImageProvider) {
        this._imageProvider = imageProvider;
    }

    async provideHover(document: vscode.TextDocument, position: vscode.Position, token: vscode.CancellationToken): Promise<vscode.Hover | undefined | null> {
        const re = this.documentPattern(document);
        if (!re) return;

        const line = document.lineAt(position).text;
        let match;
        if ((match = re.exec(line))) {
            const start = match.index;
            const end = match.index + match[0].length;
            if (start <= position.character && position.character <= end) {
                const range = new vscode.Range(new vscode.Position(position.line, start), new vscode.Position(position.line, end));
                const resource = line.substring(start, end).split(/[\\/]/).join(path.sep);

                let image;
                if (/^0x[0-9A-F]{8}$/i.test(resource)) {
                    image = await this._imageProvider.findImageById(resource);
                } else if (/^\d{9,}$/i.test(resource)) {
                    image = await this._imageProvider.findImageById(`0x${parseInt(resource, 10).toString(16)}`);
                } else {
                    image = await this._imageProvider.findImageForWorkspace(document, resource);
                }
                if (image === undefined) return;

                const uri = image.cachedUri ? image.cachedUri : image.uri;
                const markdown: vscode.MarkdownString[] = [];
                if (image.description) markdown.push(new vscode.MarkdownString(`${image.description}`));
                markdown.push(new vscode.MarkdownString(`${image.width}x${image.height}`));
                markdown.push(new vscode.MarkdownString(`![](${uri})`));
                return new vscode.Hover(markdown, range);
            }
        }
        return undefined;
    }
    documentPattern(document: vscode.TextDocument): RegExp | undefined {
        if (/\bSkinDefinition\.xml$/.test(document.uri.fsPath)) {
            return REGEX_SKIN;
        } else if (/\.plugin$/.test(document.uri.fsPath)) {
            return REGEX_PLUGIN;
        } else if (document.languageId === 'lua') {
            return REGEX_LUA;
        }
        return undefined;
    }
}
