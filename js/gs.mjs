import "./browser.js";
import "./gs.js";

const createModuleFromExports = globalThis.exports.Module;
delete globalThis.exports;

export default function () {
  const args = arguments;
  return Promise.resolve()
    .then(function () {
      if (globalThis.process) {
        return Promise.all([import("path"), import("module")]);
      }
    })
    .then(function (mods) {
      if (mods) {
        globalThis.__dirname = mods[0].dirname(import.meta.url);
        globalThis.require = mods[1].createRequire(import.meta.url);
        return require("./gs.js").apply(undefined, args);
      } else {
        return (createModuleFromExports || createModule).apply(undefined, args);
      }
    });
}
