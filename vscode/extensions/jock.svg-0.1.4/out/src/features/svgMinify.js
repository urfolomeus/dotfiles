"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const svgo = require("svgo");
function svgMinify(textEditor, edit) {
    let optimizer = new svgo({});
    let document = textEditor.document;
    //return new Promise((resolve, reject) => {
    optimizer.optimize(document.getText()).then((result) => {
        let range = new vscode_1.Range(new vscode_1.Position(0, 0), document.lineAt(document.lineCount - 1).range.end);
        textEditor.edit(e => {
            e.replace(range, result.data);
        });
    });
    //});
}
exports.svgMinify = svgMinify;
//# sourceMappingURL=svgMinify.js.map