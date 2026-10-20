// structuredClone deep-copies Maps, Sets, Dates and cycles (unlike JSON round-trips).
const original = { when: new Date(0), tags: new Set(["a", "b"]), nested: { n: 1 } };
original.self = original;

const copy = structuredClone(original);
copy.nested.n = 2;

console.log(original.nested.n, copy.nested.n);
console.log(copy.when instanceof Date, copy.tags.has("a"), copy.self === copy);
