"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = require("fs");
const path_1 = require("path");
const vscode_1 = require("vscode");
const svgo = require("svgo");
class SvgFormattingProvider {
    constructor() {
        this.disableFormatOnSave = false;
        this._lastKnownFormatTime = 0;
        this._lastKnownFormatChanged = false;
        var pluginDirs = path_1.join(__dirname, '..', '..', '..', 'node_modules', 'svgo', 'plugins');
        this._plugins = fs_1.readdirSync(pluginDirs)
            .map((file) => file.replace(path_1.extname(file), ''));
        vscode_1.workspace.onDidChangeConfiguration(() => {
            this.updateConfiguration();
        });
        this.updateConfiguration();
        vscode_1.workspace.onWillSaveTextDocument(e => {
            if (this.disableFormatOnSave && this._lastKnownFormatChanged && e.document.fileName == this._lastKnownFormatDocument && this._lastKnownFormatTime + 50 > new Date().getTime()) {
                // In Save Format.
                this.restoreUnformatDocument(e);
            }
        }, this);
    }
    updateConfiguration() {
        let svgConf = vscode_1.workspace.getConfiguration('svg');
        this.disableFormatOnSave = svgConf.get("disableFormatOnSave");
    }
    restoreUnformatDocument(e) {
        vscode_1.commands.executeCommand('default:undo');
    }
    provideDocumentFormattingEdits(document, options, token) {
        let config = vscode_1.workspace.getConfiguration('svg.format.plugins');
        let plugins = this._plugins
            .map((configName) => {
            let plugin = {};
            plugin[configName] = config[configName] || false;
            return plugin;
        });
        let formatter = new svgo({
            plugins: plugins,
            js2svg: { pretty: true }
        });
        return new Promise((resolve, reject) => {
            var oldText = document.getText();
            var p = formatter.optimize(oldText);
            p.then((result) => {
                let range = new vscode_1.Range(new vscode_1.Position(0, 0), document.lineAt(document.lineCount - 1).range.end);
                resolve([new vscode_1.TextEdit(range, result.data)]);
                this._lastKnownFormatChanged = (oldText != result.data);
                this._lastKnownFormatDocument = document.fileName;
                this._lastKnownFormatTime = new Date().getTime();
            }).catch(e => {
                vscode_1.window.showWarningMessage('Unable to format because of an error\r\n' + e);
                reject(e);
            });
        });
    }
}
exports.SvgFormattingProvider = SvgFormattingProvider;
//# sourceMappingURL=svgFormattingProvider.js.map