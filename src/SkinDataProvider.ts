const data: SkinData = require('./SkinData.json');
import * as fs from 'fs';
import * as vscode from 'vscode';
import { DOMParser as dom } from '@xmldom/xmldom';
import * as xpath from 'xpath';
import path from 'path';

export interface Asset {
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

export interface SkinData {
    panels: { [key: string]: SkinElement },
    assets: { [key: string]: Asset }
}

function traverseAndMapAssets(el: SkinElement, element2Asset: Map<string, Asset[]>) {
    if (el.assets && el.assets.length > 0) {
        const assets = el.assets.map(a => data.assets[a]);
        element2Asset.set(el.id, assets);
    }
    if (el.c) {
        for (let i = 0; i < el.c.length; i++) {
            traverseAndMapAssets(el.c[i], element2Asset);
        }
    }
}

export const element2AssetMap = new Map<string, Asset[]>();
Object.values(data.panels).forEach(e => traverseAndMapAssets(e, element2AssetMap));

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


export const { panels, assets } = data;
//export const element2AssetMap = e2a;
