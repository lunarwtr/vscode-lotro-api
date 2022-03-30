import * as vscode from 'vscode';
import * as path from 'path';
import { Colors } from './colors';

interface XMLSchemaAssocation {
	pattern: string,
	systemId: string
};

// this method is called when your extension is activated
export function activate(context: vscode.ExtensionContext) {
	console.log("activate lunarwtr.lotro-api", context.extension.id);

	const extensionPath = vscode.extensions.getExtension(context.extension.id)?.extensionPath;
	const config = vscode.workspace.getConfiguration("Lua");
	let globals: {[id: string] : string} | undefined = config.get("runtime.special");
	if (globals && !globals.import) {
		globals.import = 'require';
		config.update("runtime.special", globals);
	}
	config.update("runtime.version", "Lua 5.1");
	config.update("runtime.pathStrict", false);
	const searchPaths: string[] | undefined = config.get("runtime.path");
	if (searchPaths) {
		if (searchPaths.indexOf('?/__init__.lua') === -1) {
			searchPaths.push('?/__init__.lua');
		}
		config.update("runtime.path",searchPaths);
	}
	if (extensionPath) {
		// define plugin location
		config.update("runtime.plugin", path.join(extensionPath!, 'Lua', 'Plugin', 'plugin.lua'));
		// define API library location
		const library: string[] | undefined = config.get("workspace.library");
		if (library) {
			const filteredLib = library.filter(a => !/vscode-lotro-api/.test(a) && a.indexOf(context.extension.id) === -1);
			if (library.length > 0 && filteredLib.length !== library.length) {
				// early version settings were placed in global settings.. update them
				config.update("workspace.library", filteredLib, true);
			}
			filteredLib.push(path.join(extensionPath!, 'Lua', 'EmmyLua', 'Turbine'));
			config.update("workspace.library", filteredLib);
		}
		// define plugin association and schema locations
		const xmlConfig = vscode.workspace.getConfiguration("xml");
		let schemasAssoc: XMLSchemaAssocation[] | undefined = xmlConfig.get("fileAssociations");
		if (schemasAssoc) {
			schemasAssoc = schemasAssoc.filter(a => !/(SkinDefinition.xml|\.plugin(compendium)?)$/.test(a.pattern));
			// Uri.file(context.asAbsolutePath(path.join('xsds', 'lotroplugin.xsd')))
			schemasAssoc.push({ pattern: '**/*.plugin', systemId: path.join(extensionPath!, 'xsds', 'lotroplugin.xsd')});
			schemasAssoc.push({ pattern: '**/*.plugincompendium', systemId: path.join(extensionPath!, 'xsds', 'plugincompendium.xsd')});
			schemasAssoc.push({ pattern: '**/SkinDefinition.xml', systemId: path.join(extensionPath!, 'xsds', 'lotro-skin.xsd')});
			xmlConfig.update("fileAssociations", schemasAssoc);
		}
	}
	const filesConfig = vscode.workspace.getConfiguration("files");
	let associations: {[id: string] : string} | undefined = filesConfig.get("associations");
	if (associations) {
		associations["*.plugin"] = "xml";
		associations["*.plugincompendium"] = "xml";
		filesConfig.update("associations", associations);
	}

	console.log('decorator sample is activated');

	let timeout: NodeJS.Timer | undefined = undefined;

	// create a decorator type that we use to decorate small numbers
	const colorDecorationType = vscode.window.createTextEditorDecorationType({});
	
	let activeEditor = vscode.window.activeTextEditor;
	function updateDecorations() {
		if (!activeEditor) {
			return;
		}
		if (activeEditor.document.languageId !== 'lua') {
			return;
		}
		const regEx = /Turbine.UI.Color(\.(\w+)|\((\s*\d*(\.\d+)?\s*(,\s*\d*(\.\d+)?\s*){2,3})\))/g;
		const text = activeEditor.document.getText();
		const colors: vscode.DecorationOptions[] = [];
		let match;
		while ((match = regEx.exec(text))) {
			let style = '';
			if (match[1].startsWith('.')) {
				const c = Colors[match[2]];
				style = `rgba(${Math.ceil(255*c.R)},${Math.ceil(255*c.G)},${Math.ceil(255*c.B)},${c.A})`;
			} else {
				const c = match[3].trim().split(/\s*,\s*/).map(n => parseFloat(n));
				if (c.length === 3) {
					c.unshift(1);
				}
				if (c.filter(n => n > 1).length > 0) {
					// invalid color value
					continue;
				}
				style = `rgba(${Math.ceil(255*c[1])},${Math.ceil(255*c[2])},${Math.ceil(255*c[3])},${c[0]})`;
			}

			const startPos = activeEditor.document.positionAt(match.index);
			const endPos = activeEditor.document.positionAt(match.index + match[0].length);
			const decoration: vscode.DecorationOptions = {
				range: new vscode.Range(startPos, endPos),
				renderOptions: {
					after: {
						color: style,
						contentText: '⬤',
						margin: '0 0 0 2px'
					}
				}
			};
			colors.push(decoration);
		}
		activeEditor.setDecorations(colorDecorationType, colors);
		
	}

	function triggerUpdateDecorations(throttle: boolean = false) {
		if (timeout) {
			clearTimeout(timeout);
			timeout = undefined;
		}
		if (throttle) {
			timeout = setTimeout(updateDecorations, 500);
		} else {
			updateDecorations();
		}
	}

	if (activeEditor) {
		triggerUpdateDecorations();
	}
	vscode.window.onDidChangeTextEditorSelection((e) => {
		console.log(e);
	});
	vscode.window.onDidChangeActiveTextEditor(editor => {
		activeEditor = editor;
		if (editor) {
			triggerUpdateDecorations();
		}
	}, null, context.subscriptions);

	vscode.workspace.onDidChangeTextDocument(event => {
		if (activeEditor && event.document === activeEditor.document) {
			triggerUpdateDecorations(true);
		}
	}, null, context.subscriptions);

}

// this method is called when your extension is deactivated
export function deactivate() {
	console.log("deactivate lunarwtr.lotro-api");
}
