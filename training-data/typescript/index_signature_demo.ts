interface StringMap {
  [key: string]: number;
}

const wordLengths: StringMap = {};
for (const word of ["alpha", "be", "gamma"]) {
  wordLengths[word] = word.length;
}

type Registry = {
  version: string;
  [plugin: `plugin_${string}`]: () => string;
};

const registry: Registry = {
  version: "1.0",
  plugin_logger: () => "logging",
  plugin_cache: () => "caching",
};

console.log(wordLengths);
for (const key of Object.keys(registry)) {
  if (key.startsWith("plugin_")) {
    console.log(key, (registry as any)[key]());
  }
}
const lookup = wordLengths["missing"]; // typed number, actually undefined
console.log(lookup === undefined ? "no entry" : lookup);
