const src = { d: new Date(0), s: new Set([1, 2]), n: undefined };
const a = structuredClone(src);
const b = JSON.parse(JSON.stringify(src));
console.log(a.d instanceof Date, a.s instanceof Set);
console.log(typeof b.d, b.s);
