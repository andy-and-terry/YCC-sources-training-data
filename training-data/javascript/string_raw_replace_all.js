const text = "a.b.c.d";
console.log(text.replace(".", "-"));
console.log(text.replaceAll(".", "-"));
console.log(text.replace(/\./g, "-"));

console.log("x-y-z".replaceAll("-", (match, offset) => `[${offset}]`));
console.log("price: $5".replaceAll("$", "$$$$"));

console.log(String.raw`C:\new\table\n`);
const name = "dir";
console.log(String.raw`C:\${name}\file`);

console.log("abc".padStart(6, "*"), "abc".padEnd(6, "-") + "|");
console.log("  trim me  ".trimStart() + "|", "|" + "  trim me  ".trimEnd());
console.log("ha".repeat(3), "Hello".at(-1));
console.log("a-b_c d".split(/[-_ ]/));
console.log("camelCaseStringHere".replace(/([A-Z])/g, " $1").toLowerCase());
console.log("one two".split(" ").map((w) => w[0].toUpperCase() + w.slice(1)).join(" "));
console.log("ß".toUpperCase(), "İ".toLowerCase().length);
console.log("abc".localeCompare("abd"), "a".codePointAt(0), String.fromCodePoint(128512));
