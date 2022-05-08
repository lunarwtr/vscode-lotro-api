
/// <reference types="node" />

export default class TGA {
    static createTgaBuffer(width: any, height: any, pixels: any, dontFlipY: any): any;
    constructor(buf: any);
    _buf: any;
    data: Uint8Array;
    currentOffset: number;
    parseHeader(): void;
    header: any;
    width: any;
    height: any;
    isUsingColorMap: any;
    isUsingRLE: any;
    isGray: any;
    hasAlpha: number | boolean;
    isFlipX: number;
    isFlipY: boolean;
    parseFooter(): void;
    parseExtension(extensionAreaOffset: any): void;
    readColor(offset: any, bytesPerPixel: any): Uint8Array;
    readColorWithColorMap(offset: any): Uint8Array;
    readColorAuto(offset: any, bytesPerPixel: any, isUsingColorMap: any): Uint8Array;
    parseColorMap(): void;
    colorMap: Uint8Array;
    setPixel(pixels: any, idx: any, color: any): void;
    parsePixels(): void;
    pixels: Uint8Array;
    parse(): void;
    fixForAlpha(): void;
}
//export default TGA;