import * as vscode from 'vscode';
import * as path from 'path';

// this method is called when your extension is activated
export function activate(context: vscode.ExtensionContext) {
	console.log("activate lunarwtr.lotro-api", context.extension.id);
	setExternalLibrary("Turbine", true);

	const config = vscode.workspace.getConfiguration("Lua");
	let globals: {[id: string] : string} | undefined = config.get("runtime.special");
	if (globals && !globals.import) {
		globals.import = 'require';
		config.update("runtime.special", globals);
	}
	config.update("runtime.version", "Lua 5.1");
}

// this method is called when your extension is deactivated
export function deactivate() {
	console.log("deactivate lunarwtr.lotro-api");
	setExternalLibrary("Turbine", false);
}

function setExternalLibrary(folder: string, enable: boolean) {
	const extensionId = "lunarwtr.lotro-api"; // this id is case sensitive
	const extensionPath = vscode.extensions.getExtension(extensionId)?.extensionPath;
	const folderPath = path.join(extensionPath!, 'EmmyLua', folder);
	const config = vscode.workspace.getConfiguration("Lua");
	const library: string[] | undefined = config.get("workspace.library");
	if (library && extensionPath) {
		// remove any older versions of our path e.g. "publisher.name-0.0.1"
		for (let i = library.length-1; i >= 0; i--) {
			const el = library[i];
			const isSelfExtension = el.indexOf(extensionId) > -1;
			const isCurrentVersion = el.indexOf(extensionPath) > -1;
			if (isSelfExtension && !isCurrentVersion) {
				library.splice(i, 1);
			}
		}
		const index = library.indexOf(folderPath);
		if (enable) {
			if (index === -1) {
				library.push(folderPath);
			}
		} else {
			if (index > -1) {
				library.splice(index, 1);
			}
		}
		config.update("workspace.library", library, true);
	}
}