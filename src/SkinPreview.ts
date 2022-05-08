
import * as vscode from 'vscode';
import { ImageProvider } from './LotroImageHoverProvider';
import { element2AssetMap, panels, SkinDefinitionParser, SkinElement } from './SkinDataProvider';

export class SkinPreviewManager implements vscode.WebviewPanelSerializer<SkinState> {

	private _disposables: vscode.Disposable[] = [];

	public currentPanel: SkinPreviewPanel | undefined;

	public readonly viewType = 'skin.preview';

	public constructor(protected _extensionUri: vscode.Uri, protected _imageProvider: ImageProvider) {

		this._disposables.push(vscode.commands.registerCommand('skinviewer.open', (mainUri?: vscode.Uri, allUris?: vscode.Uri[]) => {
			for (const uri of Array.isArray(allUris) ? allUris : [mainUri]) {
				this.createOrShow(uri!);
			}
		}));

		vscode.workspace.onDidChangeConfiguration((event: vscode.ConfigurationChangeEvent) => {
			if (event.affectsConfiguration('lotro-api.skinningAssets') && this.currentPanel) {
				this.currentPanel.updateOptions(this.getWebviewOptions());
			}
		}, null, this._disposables);

		if (vscode.window.registerWebviewPanelSerializer) {
			// Make sure we register a serializer in activation event
			vscode.window.registerWebviewPanelSerializer(this.viewType, this);
		}

	}

	public createOrShow(resource: vscode.Uri) {

		//const textDocument = await vscode.workspace.openTextDocument(resource);
		if (!/\bSkinDefinition\.xml$/.test(resource.fsPath)) return;

		const column = (vscode.window.activeTextEditor && vscode.window.activeTextEditor.viewColumn) || vscode.ViewColumn.One;

		// If we already have a panel, show it.
		if (this.currentPanel) {
			this.currentPanel.reveal(column);
			return;
		}

		// Otherwise, create a new panel.
		const panel = vscode.window.createWebviewPanel(
			this.viewType,
			'Skin Preview',
			column,
			this.getWebviewOptions()
		);

		const state = { resource: resource.toString(), zoom: 'fit', selectedPanelID: 'ID_UISkin_Toolbar' };
		this.currentPanel = new SkinPreviewPanel(panel, this._extensionUri, state, this._imageProvider);

		// Listen for when the panel is disposed
		// This happens when the user closes the panel or when the panel is closed programmatically
		panel.onDidDispose(() => {
			this.currentPanel?.dispose();
			this.currentPanel = undefined;
		}, null, this._disposables);

	}

	async deserializeWebviewPanel(panel: vscode.WebviewPanel, state: SkinState) {
		console.log(`Got state: ${JSON.stringify(state || {})}`);
		// Reset the webview options so we use latest uri for `localResourceRoots`.
		panel.webview.options = this.getWebviewOptions();
		this.currentPanel = new SkinPreviewPanel(panel, this._extensionUri, state, this._imageProvider);
	}

	public dispose(): void {
		if (this.currentPanel) {
			this.currentPanel.dispose();
			this.currentPanel = undefined;
		}

		while (this._disposables.length) {
			const x = this._disposables.pop();
			if (x) x.dispose();
		}
	}

	getWebviewOptions(): vscode.WebviewOptions {
		return {
			enableScripts: true,
			localResourceRoots: [
				... this._imageProvider.getResourceRoots(),
				vscode.Uri.joinPath(this._extensionUri, 'media')
			]
		};
	}
}

/**
 * Manages cat coding webview panels
 */
export class SkinPreviewPanel {

	private _disposables: vscode.Disposable[] = [];
	private _resource: vscode.Uri;
	private _parser: SkinDefinitionParser;
	private _document!: vscode.TextDocument;

	public constructor(private _panel: vscode.WebviewPanel, protected _extensionUri: vscode.Uri, protected _state: SkinState, protected _imageProvider: ImageProvider) {
		this._resource = vscode.Uri.parse(_state.resource);
		this._parser = new SkinDefinitionParser();

		// Set the webview's initial html content
		this._update();

		// Update the content based on view changes
		this._panel.onDidChangeViewState(event => {
			if (this._panel.visible) {
				this._update();
			}
		}, null, this._disposables);
		vscode.workspace.onDidChangeTextDocument(event => {
			if (event.document.uri.fsPath === this._resource.fsPath && this._panel.visible) {
				this._update();
			}
		}, null, this._disposables);
		// Handle messages from the webview
		this._panel.webview.onDidReceiveMessage(event => {
			if (event.body.resource !== this._state.resource) {
				return;
			}
			switch (event.command) {
				case 'setState':
					var oldState = this._state;
					this._state = event.body;
					if (oldState.selectedPanelID !== this._state.selectedPanelID) {
						console.log(`panel selection changes ${this._state.selectedPanelID}`);
						this._update();
					}
			}
		}, null, this._disposables);

	}

	updateOptions(options: vscode.WebviewOptions) {
		this._panel.webview.options = options;
		this._update();
	}

	public reveal(column: vscode.ViewColumn) {
		this._panel.reveal(column);
	}

	public dispose() {
		// Clean up our resources
		this._panel.dispose();

		while (this._disposables.length) {
			const x = this._disposables.pop();
			if (x) x.dispose();
		}
	}

	private async _update() {
		const webview = this._panel.webview;
		this._updateForPanelID(webview, this._state.selectedPanelID);
	}

	private async _updateForPanelID(webview: vscode.Webview, panelID: string) {
		this._panel.title = panelID;
		this._panel.webview.html = await this._getHtmlForWebview(webview, panelID);
	}

	private async _getHtmlForWebview(webview: vscode.Webview, panelID: string) {

		this._document = await vscode.workspace.openTextDocument(this._resource);
		this._parser.parseFromString(this._document.getText());

		// Local path to main script run in the webview
		const scriptPathOnDisk = vscode.Uri.joinPath(this._extensionUri, 'media', 'main.js');

		// And the uri we use to load this script in the webview
		const scriptUri = webview.asWebviewUri(scriptPathOnDisk);

		// Local path to css styles
		const stylesPathMainPath = vscode.Uri.joinPath(this._extensionUri, 'media', 'skin.css');

		// Uri to load styles into webview
		const stylesMainUri = webview.asWebviewUri(stylesPathMainPath);

		return `<!DOCTYPE html>
			<html lang="en">
			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link href="${stylesMainUri}" rel="stylesheet">
				<title>${this._parser.skinName}</title>
			</head>
			<body class="container">
				<div class="skin-toolbar">
					<div class="skin-zoom-container">
						<button class="skin-btn" type="button" title="Zoom in" id="zoom_in">+</button>
						<button class="skin-btn" type="button" title="Zoom out" id="zoom_out">-</button>
						<button class="skin-btn" type="button" title="Reset Zoom" id="zoom_reset">&#8634;</button>
						<button class="skin-btn" type="button" title="Fit" id="zoom_fit">&harr;</button>	
					</div>
					${this._renderSkinPanelDropdown(panelID)}
				</div>
				<div id="skin-panel-container" class="skin-panel" data-state="${encodeHTMLEntities(JSON.stringify(this._state || {}))}">${await this._renderSkinPanel(panelID)}</div>
				<script src="${scriptUri}"></script>
			</body>
			</html>`;
	}
	private _renderSkinPanelDropdown(selected: string) {
		return `<select id="skin-panel-ddl">${Object.keys(panels).sort().map(id => `<option${selected === id ? ' selected' : ''}>${id}</option>`)}</select>`;
	}
	private async _renderSkinPanel(panelName: string) {
		let panel = this._parser.panels[panelName];
		if (!panel) {
			panel = panels[panelName];
		}
		if (!panel) {
			return `<h2>Panel ${panelName} Not Found</h2>`;
		}
		return await this._renderSkinElement(panel, 0);
	}
	private async _renderSkinElement(el: SkinElement, level: number): Promise<string> {
		const left = level === 0 ? 0 : (el.b.x || 0);
		const top = level === 0 ? 0 : (el.b.y || 0);

		let img;
		try {
			const assets = element2AssetMap.get(el.id);
			if (assets && assets.length > 0) {
				const a = assets[0];
				if (this._parser.assets[a.n]) {
					const file = this._parser.assets[a.n];
					// the skin has this asset defined
					img = await this._imageProvider.findImageForWorkspace(this._document, file);
				}
			}
			if (!img && el.assets && el.assets.length > 0) {
				// fall back to main skin assets
				img = await this._imageProvider.findImageById(el.assets[0]);
			}
		} catch (ex) {
			console.error(ex);
		}
		const styles = [
			`top: ${top}px;`,
			`left: ${left}px;`,
			`height: ${el.b.h || 0}px;`,
			`width: ${el.b.w || 0}px;`
		];
		if (img) {
			styles.push(`background-image: url('${this._panel.webview.asWebviewUri(img.cachedUri ? img.cachedUri : img.uri)}');`);
		}
		return `<div id="${el.id}" tooltip="${el.id}" class="skin-element" style="${styles.join(' ')}">${el.c ? (await Promise.all(el.c.map(async c => await this._renderSkinElement(c, level + 1)))).join('') : ''}</div>`;
	}
}

const encodeHTMLEntities = (s: string) => s.replace(/[\u00A0-\u9999\<\>\&\"]/g, i => '&#' + i.charCodeAt(0) + ';');

export interface SkinState {
	resource: string;
	selectedPanelID: string;
	zoom: any;
};