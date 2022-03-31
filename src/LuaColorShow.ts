import {
    DocumentColorProvider,
    TextDocument,
    CancellationToken,
    ProviderResult,
    Color,
    ColorPresentation,
    ColorInformation,
    Range
} from "vscode";
import { Colors as TurbineColors, ColorLookup as TurbineColorLookup, roundRgb } from "./colors";

class LuaColorShow implements DocumentColorProvider {
    provideDocumentColors(document: TextDocument, token: CancellationToken): ProviderResult<ColorInformation[]> {
        if (document.languageId !== 'lua') {
            return;
        }
        let colors: ColorInformation[] = [];
        const regEx = /Turbine.UI.Color(\.(\w+)|\((\s*\d*(\.\d+)?\s*(,\s*\d*(\.\d+)?\s*){2,3})\))/g;
        const text = document.getText();
        let match;
        while ((match = regEx.exec(text))) {
            let color;
            if (match[1].startsWith('.')) {
                const c = TurbineColors[match[2]];
                if (!c) {
                    // not a legit Turbine Color
                    continue;
                }
                color = new Color(c.R, c.G, c.B, c.A);
            } else {
                const c = match[3].trim().split(/\s*,\s*/).map(n => parseFloat(n));
                if (c.length === 3) {
                    c.unshift(1);
                }
                if (c.filter(n => n > 1).length > 0) {
                    // invalid color value
                    continue;
                }
                color = new Color(c[1], c[2], c[3], c[0]);
            }

            const startPos = document.positionAt(match.index);
            const endPos = document.positionAt(match.index + match[0].length);
            colors.push(new ColorInformation(new Range(startPos, endPos), color));
        }
        return colors;
    }
    provideColorPresentations(color: Color, context: { document: TextDocument; range: Range; }, token: CancellationToken): ProviderResult<ColorPresentation[]> {
        const pieces = [color.alpha, color.red, color.green, color.blue].map(n => roundRgb(n));
        const knownColor = TurbineColorLookup[pieces.join(':')];
        if (knownColor) {
            return [new ColorPresentation(`Turbine.UI.Color.${knownColor}`)];
        }
        if (color.alpha === 1) {
            pieces.shift();
        }
        return [new ColorPresentation(`Turbine.UI.Color(${pieces.join(',')})`)];
    }
}
export default LuaColorShow;