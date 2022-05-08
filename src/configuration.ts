import * as vscode from 'vscode';
import { ViewColumn } from 'vscode';

export class Configuration {

    public static skinningAssetsPath(): string | null {
        return vscode.workspace.getConfiguration('lotro-api').get('skinningAssets', null);
    }

}