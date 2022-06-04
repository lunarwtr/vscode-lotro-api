/* eslint-disable @typescript-eslint/naming-convention */
const data: SkinData = require('./SkinData.json');
import { DOMParser as dom } from '@lunarwater/xmldom';
import * as fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import * as vscode from 'vscode';
import * as xpath from 'xpath';
import { mergeSkinXml } from './SkinMerge';
const readFileAsync = promisify(fs.readFile);

const DEFAULT_SKIN_DICTIONARY_FOLDER_PATH = path.join(vscode.extensions.getExtension('lunarwtr.lotro-api')!.extensionPath, 'resources', 'skinning');
const DEFAULT_SKIN_DICTIONARY_PATH = path.join(DEFAULT_SKIN_DICTIONARY_FOLDER_PATH, 'SkinDictionary.xml');
const EXTRA_SKIN_DICTIONARY_PATH = path.join(DEFAULT_SKIN_DICTIONARY_FOLDER_PATH, 'SkinDictionary-extra.xml');

export interface Asset {
    id: string;
    // width
    w: number,
    // name
    n: string,
    // height
    h: number
};

export interface SkinElement {
    id: string,
    // bounds
    b: Bounds,
    // assets
    assets?: string[],
    // children
    c?: SkinElement[]
};

export interface Bounds {
    // width
    w: number,
    x: number,
    y: number,
    // height
    h: number
};

export interface PanelBoundBox {
    top: number,
    bottom: number,
    left: number,
    right: number
}

interface Asset2ID { [key: string]: string }
interface Element2Asset { [key: string]: Asset[] }
interface ID2Asset { [key: string]: Asset }

export interface SkinData {
    e2a: Element2Asset,
    a2id: Asset2ID,
    assets: ID2Asset
};

export function determineBoundingBox(els: SkinElement[]): PanelBoundBox {
    if (!els) {
        return { top: 0, bottom: 0, left: 0, right: 0 };
    }
    let bb: PanelBoundBox | undefined = undefined;
    for (let i = 0; i < els.length; i++) {
        bb = determineElementBoundingBox(els[i], undefined, undefined, bb);
    }
    return bb!;
}

export function determineElementBoundingBox(el: SkinElement, offsetX?: number, offsetY?: number, bb?: PanelBoundBox): PanelBoundBox {
    if (!el) {
        return { top: 0, bottom: 0, left: 0, right: 0 };
    }
    const b = el.b;
    if (b.x >= 2000 || b.y >= 2000) {
        // escape out if element is pushed way off
        return bb!;
    }
    const x = offsetX ? offsetX + b.x : b.x;
    const y = offsetY ? offsetY + b.y : b.y;
    if (bb) {
        bb.top = Math.max(0, Math.min(y, bb.top));
        bb.left =  Math.max(0, Math.min(x, bb.left));
        bb.bottom = Math.max(y + b.h, bb.bottom);
        bb.right = Math.max(x + b.w, bb.right);
    } else {
        bb = { top: y, bottom: y + b.h, left: x, right: x + b.w };
    }
    el.c?.forEach(e => determineElementBoundingBox(e, x, y, bb));
    return bb;
}

function attr(path: string, node: Node): string {
    return (xpath.select1(path, node) as Attr)?.value || '';
}

function nodes(path: string, node: Node): Array<Element> {
    return xpath.select(path, node) as Array<Element>;
}

export enum PanelSource {
    AUTHOR,
    DEFAULT,
    EXTENDED
};

export interface PanelDetail {
    id: string;
    source: PanelSource;
    elementCount: number;
    elements: SkinElement[];
};
interface ParseStat {
    totalCount: number;
}
export class SkinDefinitionParser {

    private _skinName: string = "";
    private _assets:  { [key: string]: string } = {};
    private _panels: { [key: string]: PanelDetail } = {};
    private _referencedPanels: string[] = [];

	public async parseFromResource(_resource: vscode.Uri, includeExtraPanels: boolean) {
        this.parseFromString((await readFileAsync(_resource.fsPath)).toString(), includeExtraPanels);
	}

    public async parseFromString(content: string, includeExtraPanels: boolean) {
        const doc = new dom().parseFromString(content); 
        
        this._referencedPanels = this.panelsInDoc(doc);
        let extraSkinPanels: string[] = [];

        const defaultSkin = new dom().parseFromString((await readFileAsync(DEFAULT_SKIN_DICTIONARY_PATH)).toString());
        mergeSkinXml(doc.documentElement, defaultSkin.documentElement);
        if (includeExtraPanels) {
            const extraSkin = new dom().parseFromString((await readFileAsync(EXTRA_SKIN_DICTIONARY_PATH)).toString());
            extraSkinPanels = this.panelsInDoc(extraSkin);
            mergeSkinXml(doc.documentElement, extraSkin.documentElement);
        }
        // const ser = new XMLSerializer();
        // fs.writeFileSync(path.join(os.tmpdir(), "lotro-api", "Merged.xml"), ser.serializeToString(doc));

        // <SkinName Name="xxxxxxxx"></SkinName>
        this._skinName = attr('//SkinName/@Name', doc);

        // <Mapping ArtAssetID="xxxx" FileName="xxxxxx"></Mapping>
        this._assets = {};
        nodes('//Mapping', doc).forEach( sv => {
            const name = attr('./@ArtAssetID', sv);
            const filename = attr('./@FileName', sv);
            if (!name || !filename) return;
            this._assets[name] = filename.split(/[\\/]/).join(path.sep);
        });

        this._panels = {};
        nodes('//PanelFile', doc).forEach( panel => {
            const id = attr('./@ID', panel);
            const n = nodes('./Element', panel);
            let source = PanelSource.DEFAULT;
            if (this._referencedPanels.includes(id)) {
                source = PanelSource.AUTHOR;
            } else if (extraSkinPanels.includes(id)) {
                source = PanelSource.EXTENDED;
            }
            const stat = { totalCount: 0 };
            const elements = n.map(cur => this.parsePanelElement(cur, stat));
            if (n && n.length > 0) {
                this._panels[id] = { source, elements, id, elementCount: stat.totalCount };
            }
        });
    }

    private panelsInDoc(doc: Document): string[] {
        const panels: string[] = [];
        nodes('//PanelFile', doc).forEach( panel => {
            const id = attr('./@ID', panel);
            if (id) panels.push(id);
        });
        return panels;
    }

    private parsePanelElement(node:  Element, stats: ParseStat): SkinElement {
        const id = node.getAttribute('ID') || '';
        stats.totalCount++;
        const bounds: Bounds = {
            w: parseInt(node.getAttribute('Width') || '0', 10),
            x: parseInt(node.getAttribute('X') || '0', 10),
            y: parseInt(node.getAttribute('Y') || '0', 10),
            h: parseInt(node.getAttribute('Height') || '0', 10),
        };
        const children = nodes('./Element', node).map(e => this.parsePanelElement(e, stats));
        return { id: id, b: bounds, c: children };
    }
    
    public get skinName(): string { return this._skinName; }
    public get assets() { return this._assets; }
    public get panels() { return this._panels; }
    public get referencedPanels(): string[] { return this._referencedPanels; }

}

export const { a2id, e2a, assets } = data;
