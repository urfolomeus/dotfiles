"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const assert = require("assert");
const sinon = require("sinon");
const severity = require("../src/severity");
const vscodeMock = require("./vscode_mock");
describe("severity", () => {
    describe(".parse", () => {
        it("should return `1` by default", () => {
            const result = severity.parse("BLAH", vscodeMock);
            assert.equal(result, 1);
        });
        it("should return `defaultSeverity` setting by default if set", () => {
            const testSeverity = 42;
            const mockSettings = sinon.stub(vscodeMock.workspace, "getConfiguration").callsFake(() => {
                return {
                    defaultSeverity: testSeverity,
                };
            });
            const result = severity.parse("WHAT", vscodeMock);
            assert.equal(result, testSeverity);
            mockSettings.restore();
        });
        it("should return expected severity", () => {
            [
                { check: "C", expected: 1 },
                { check: "R", expected: 1 },
                { check: "F", expected: 1 },
                { check: "D", expected: 1 },
                { check: "W", expected: 1 },
            ].forEach((t) => {
                const result = severity.parse(t.check, vscodeMock);
                const error = `${result} === ${t.expected} when check is "${t.check}"`;
                assert.equal(result, t.expected);
            });
        });
        it("should return expected default severity for each error from settings", () => {
            const consistencyError = 10;
            const readabilityError = 11;
            const refactoringError = 12;
            const designError = 14;
            const warningsError = 15;
            const mockSettings = sinon.stub(vscodeMock.workspace, "getConfiguration").callsFake(() => {
                return {
                    consistencySeverity: consistencyError,
                    designSeverity: designError,
                    readabilitySeverity: readabilityError,
                    refactoringSeverity: refactoringError,
                    warningsSeverity: warningsError,
                };
            });
            [
                { check: "C", expected: consistencyError },
                { check: "R", expected: readabilityError },
                { check: "F", expected: refactoringError },
                { check: "D", expected: designError },
                { check: "W", expected: warningsError },
            ].forEach((t) => {
                const result = severity.parse(t.check, vscodeMock);
                const error = `${result} === ${t.expected} when check is "${t.check}"`;
                assert.equal(result, t.expected);
            });
            mockSettings.restore();
        });
    });
});
//# sourceMappingURL=severity_spec.js.map