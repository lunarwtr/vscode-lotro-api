const data: SkinData = require('./SkinData.json');
import { DOMParser as dom } from '@lunarwater/xmldom';
import * as fs from 'fs';
import path from 'path';
import * as vscode from 'vscode';
import * as xpath from 'xpath';
import { mergeSkinXml } from './SkinMerge';

const DEFAULT_SKIN_DICTIONARY_PATH = path.join(vscode.extensions.getExtension('lunarwtr.lotro-api')!.extensionPath, 'resources', 'skinning', 'SkinDictionary.xml');

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

export function determineBoundingBox(el: SkinElement, offsetX?: number, offsetY?: number, bb?: PanelBoundBox): PanelBoundBox {
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
    el.c?.forEach(e => determineBoundingBox(e, x, y, bb));
    return bb;
}

function attr(path: string, node: Node): string {
    return (xpath.select1(path, node) as Attr)?.value || '';
}

function nodes(path: string, node: Node): Array<Element> {
    return xpath.select(path, node) as Array<Element>;
}

export class SkinDefinitionParser {

    private _skinName: string = "";
    private _assets:  { [key: string]: string } = {};
    private _panels: { [key: string]: SkinElement } = {};

	public async parseFromResource(_resource: vscode.Uri) {
        this.parseFromString(fs.readFileSync(_resource.fsPath).toString());
	}

    public parseFromString(content: string) {
        const doc = new dom().parseFromString(content);        
        const defaultSkin = new dom().parseFromString(fs.readFileSync(DEFAULT_SKIN_DICTIONARY_PATH).toString());    
        mergeSkinXml(doc.documentElement, defaultSkin.documentElement);
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
            if (n && n.length > 0) {
                this._panels[id] = this.parsePanelElement(n[0]);
            }
        });
    }

    private parsePanelElement(node:  Element): SkinElement {
        const bounds: Bounds = {
            w: parseInt(node.getAttribute('Width') || '0', 10),
            x: parseInt(node.getAttribute('X') || '0', 10),
            y: parseInt(node.getAttribute('Y') || '0', 10),
            h: parseInt(node.getAttribute('Height') || '0', 10),
        };
        const children = nodes('./Element', node).map(e => this.parsePanelElement(e));
        return { id: node.getAttribute('ID') || '', b: bounds, c: children };
    }
    
    public get skinName(): string { return this._skinName; }
    public get assets() { return this._assets; }
    public get panels() { return this._panels; }

}

export const { a2id, e2a, assets } = data;
