import * as vscode from 'vscode';
import * as path from 'path';
import * as fs from 'fs';
import * as crypto from 'crypto';
import { PNG } from 'pngjs';
import * as chokidar from 'chokidar';
import * as glob from 'glob';
import { debounce } from 'ts-debounce';
const TGA = require('tga');
import sizeOf from "image-size"; 

export interface Image {
    uri: vscode.Uri;
    ext: string;
    width?: number;
    height?: number;
    cachedUri?: vscode.Uri;
    lastmodified: number;
}

export class ImageProvider {

    private workflowPluginRoots: Map<string, Set<string>>;
    private tempDir: string;
    private tempFileImages: string[];
    private imageCache: Map<string, Image>;

    constructor(folders: readonly vscode.WorkspaceFolder[] | undefined, tempDir: string) {
        this.workflowPluginRoots = new Map<string, Set<string>>();
        this.imageCache = new Map<string, Image>();
        this.tempDir = tempDir;
        this.tempFileImages = [];

        fs.mkdirSync(this.tempDir, { recursive: true });

        // Monitor all plugin files being added or removed from workspaces
        if (folders === undefined) return;
        folders.forEach(f => {
            const watcher = chokidar.watch(path.join(f.uri.fsPath, '**/*.plugin'), {
                persistent: true,
                depth: 5
            });
            const debouncedRWPR = debounce((folder: string) => this.rebuildWorkspacePluginRoots(folder), 300, {});
            watcher.on('all', (event) => {
                if (/^(add|unlink)$/.test(event)) {
                    debouncedRWPR(f.uri.fsPath);
                }
            });
        });
    }

    dispose() {
        this.tempFileImages.forEach(f => fs.unlink(f, () => { }));
    }

    // Build distinct list of parent plugin folders
    private rebuildWorkspacePluginRoots(workspaceFolder: string) {
        glob(path.join(workspaceFolder, '**/*.plugin'), {}, (err, files) => {
            const roots = new Set<string>();
            (files || []).map(f => path.dirname(f)).map(f => path.dirname(f)).forEach(f => roots.add(f));
            this.workflowPluginRoots.set(workspaceFolder, roots);
        });
    }

    public async findImageForWorkspace(document: vscode.TextDocument, file: string): Promise<Image | undefined> {
        const paths = [path.dirname(document.fileName)];

        // if we have a workspace.. add it to the list of paths we try
        const workspace = vscode.workspace.getWorkspaceFolder(document.uri);
        if (workspace) {
            this.workflowPluginRoots.get(workspace.uri.fsPath)?.forEach(p => paths.push(p));
        }

        // find which one has a match
        const imagePath = paths.map(p => path.resolve(p, file)).find(p => fs.existsSync(p));
        if (!imagePath) return;

        const stats = fs.statSync(imagePath);
        let image = this.imageCache.get(imagePath);
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
                const tmpFile = path.join(this.tempDir, hash + ".png");

                this.tempFileImages.push(tmpFile);
                const data = fs.readFileSync(imagePath);
                var tga = new TGA(data);
                var png = new PNG({
                    width: tga.header.width,
                    height: tga.header.height
                });
                png.data = tga.pixels;
                const out = fs.createWriteStream(tmpFile);
                png.pack().pipe(out);

                const end = new Promise(function (resolve, reject) {
                    out.on('finish', () => resolve(tmpFile));
                    out.on('error', reject);
                });
                await end;

                image.cachedUri = vscode.Uri.from({ scheme: 'file', path: tmpFile });
                image.width = tga.header.width;
                image.height = tga.header.height;
                this.imageCache.set(imagePath, image);
                return image;
            } catch (ex) { }

        } else {

            const size = sizeOf(fs.readFileSync(imagePath));
            image.width = size.width;
            image.height = size.height;
            this.imageCache.set(imagePath, image);
            return image;
        }

    }

}

const REGEX_LUA = /(?<=["'])(.+?\.(jpg|jpeg|tga|png))(?=["'])/i;
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

                const image = await this._imageProvider.findImageForWorkspace(document, resource);
                if (image === undefined) return;

                const uri = image.cachedUri ? image.cachedUri : image.uri;
                return new vscode.Hover([new vscode.MarkdownString(`${image.width}x${image.height}`),new vscode.MarkdownString(`![](${uri})`)], range);
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
