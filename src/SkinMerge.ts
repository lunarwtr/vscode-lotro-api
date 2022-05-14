interface MergeConfigAttr {
    nodeName: string,
    attributeName: string
};

const SKIN_NODE_MAPPING: MergeConfigAttr[] = [
    { nodeName: 'PanelFile', attributeName: 'ID' },
    { nodeName: 'Element', attributeName: 'ID' },
    { nodeName: 'Mapping', attributeName: 'ArtAssetID' },
    { nodeName: 'SkinName', attributeName: 'Name' }
];

function isNodeEqual(obj1: Element, obj2: Element): boolean {
    if (obj1.nodeName === obj2.nodeName) {
        for (const mapping of SKIN_NODE_MAPPING) {
            if (mapping.nodeName === obj1.nodeName) {
                const attr1 = obj1.getAttribute(mapping.attributeName);
                if (attr1 === null) return false;
                const attr2 = obj2.getAttribute(mapping.attributeName);
                if (attr2 === null) return false;
                return attr1 === attr2;
            }
        }
        return true;
    }
    return false;
}

function findChild(haystack: Element, child: Element): Element | null {
    const c = haystack.childNodes;
    for (let i = 0; i < c.length; i++) {
        const cur = c[i] as Element;
        if (isNodeEqual(cur, child)) {
            return cur;
        }
    }
    return null;
}

export function mergeSkinXml(destination: Element, from: Element) {
    if (!isNodeEqual(destination, from)) return;
    if (!from.hasChildNodes()) return;

    const c = Array.prototype.slice.call(from.childNodes) as ChildNode[];
    for (let i = 0; i < c.length; i++) {
        const cur = c[i] as Element;
        if (cur.nodeName === '#text') continue;

        const child = findChild(destination, cur);
        if (child !== null) {
            mergeSkinXml(child, cur);
        } else {
            destination.appendChild(cur);
        }
    }
}
