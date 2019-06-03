"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const svgo = require("svgo");
function svgPretty(textEditor, edit) {
    let optimizer = new svgo({
        js2svg: { pretty: true }
    });
    let document = textEditor.document;
    //return new Promise((resolve, reject) => {
    optimizer.optimize(document.getText()).then((result) => {
        let range = new vscode_1.Range(new vscode_1.Position(0, 0), document.lineAt(document.lineCount - 1).range.end);
        textEditor.edit(e => {
            e.replace(range, result.data);
        });
        //resolve();
    });
    //});
}
exports.svgPretty = svgPretty;
//# sourceMappingURL=svgPretty.js.map