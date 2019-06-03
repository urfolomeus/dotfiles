'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const svgCompletionItemProvider_1 = require("./features/svgCompletionItemProvider");
const svgSymbolProvider_1 = require("./features/svgSymbolProvider");
const svgHoverProvider_1 = require("./features/svgHoverProvider");
const svgRenameProvider_1 = require("./features/svgRenameProvider");
const svgDefinitionProvider_1 = require("./features/svgDefinitionProvider");
const svgFormattingProvider_1 = require("./features/svgFormattingProvider");
const svgMinify_1 = require("./features/svgMinify");
const svgPretty_1 = require("./features/svgPretty");
const previewer_1 = require("./previewer");
const SVG_MODE = [
    {
        scheme: "file",
        language: "svg"
    },
    {
        scheme: "untitled",
        language: "svg"
    },
    {
        scheme: "file",
        language: "xml",
        pattern: "*.svg"
    }
];
function moveCursor(textEditor, edit, offset, showCompletionItems) {
    let selection = textEditor.selection;
    let doc = textEditor.document;
    let location = doc.offsetAt(selection.active);
    location += offset;
    let pos = doc.positionAt(location);
    textEditor.selection = new vscode.Selection(pos, pos);
    if (showCompletionItems === true) {
        vscode.commands.executeCommand('editor.action.triggerSuggest');
    }
}
let previewPanel = null;
function activate(context) {
    let d1 = vscode.languages.registerCompletionItemProvider(SVG_MODE, new svgCompletionItemProvider_1.SVGCompletionItemProvider(), "<", " ", "=", "\"");
    let d2 = vscode.commands.registerTextEditorCommand('_svg.moveCursor', moveCursor);
    let d3 = vscode.commands.registerTextEditorCommand('_svg.showSvg', () => d4.show());
    let d4 = new previewer_1.SvgPreviwerContentProvider();
    let d5 = vscode.languages.registerDocumentSymbolProvider(SVG_MODE, new svgSymbolProvider_1.SvgSymbolProvider());
    let d6 = vscode.languages.registerHoverProvider(SVG_MODE, new svgHoverProvider_1.SvgHoverProvider());
    let d7 = vscode.languages.registerRenameProvider(SVG_MODE, new svgRenameProvider_1.SvgRenameProvider());
    let d8 = vscode.languages.registerDefinitionProvider(SVG_MODE, new svgDefinitionProvider_1.SvgDefinitionProvider());
    let d9 = vscode.languages.registerDocumentFormattingEditProvider(SVG_MODE, new svgFormattingProvider_1.SvgFormattingProvider());
    let d10 = vscode.commands.registerTextEditorCommand('_svg.minifySvg', svgMinify_1.svgMinify);
    let d11 = vscode.commands.registerTextEditorCommand('_svg.prettySvg', svgPretty_1.svgPretty);
    context.subscriptions.push(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11);
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map