import * as vscode from 'vscode';
import * as path from 'path';
import { Colors } from './colors';
import LuaColorShow from './LuaColorShow';

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

		// Register schemas for supported lotro-api xml-based files
		vscode.extensions.getExtension("redhat.vscode-xml")?.activate().then(exports => {
			exports.addXMLFileAssociations([
				{
					systemId: path.join(extensionPath!, 'xsds', 'lotroplugin.xsd'),
					pattern: '**/*.plugin'
				},
				{
					systemId: path.join(extensionPath!, 'xsds', 'plugincompendium.xsd'),
					pattern: '**/*.plugincompendium'
				},
				{
					systemId: path.join(extensionPath!, 'xsds', 'lotro-skin.xsd'),
					pattern: '**/SkinDefinition.xml'
				}
			]);
		});

	}
	const filesConfig = vscode.workspace.getConfiguration("files");
	let associations: {[id: string] : string} | undefined = filesConfig.get("associations");
	if (associations) {
		associations["*.plugin"] = "xml";
		associations["*.plugincompendium"] = "xml";
		filesConfig.update("associations", associations);
	}

	// Register our color provider for Turbine Colors
	let luaColorShowDisposable = vscode.languages.registerColorProvider(
		{ pattern: "**/*.lua" },
		new LuaColorShow()
	);
	context.subscriptions.push(luaColorShowDisposable);

}

// this method is called when your extension is deactivated
export function deactivate() {
	console.log("deactivate lunarwtr.lotro-api");
}
