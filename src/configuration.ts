import * as vscode from 'vscode';
import { ViewColumn } from 'vscode';

export class Configuration {
    static keepConvertedAssets(): boolean {
        return vscode.workspace.getConfiguration('lotro-api').get('keepConvertedAssets', false);
    }

    static showUnofficialPanels(): boolean {
        return vscode.workspace.getConfiguration('lotro-api').get('showUnofficialPanels', false);
    }

    public static skinningAssetsPath(): string | null {
        return vscode.workspace.getConfiguration('lotro-api').get('skinningAssets', null);
    }

    public static skinningPreviewColumn(): vscode.ViewColumn {
        switch (vscode.workspace.getConfiguration('lotro-api').get('skinningPreviewColumn')) {
            case "Active": return ViewColumn.Active;
            case "Beside": return ViewColumn.Beside;
            default: return ViewColumn.Beside;
        }
    }
}