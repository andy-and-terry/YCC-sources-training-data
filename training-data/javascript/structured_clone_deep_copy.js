const original = { when: new Date(0), tags: new Set(["a", "b"]), nested: { n: [1, 2, 3] } };
const copy = structuredClone(original);
copy.nested.n.push(4);
console.log(original.nested.n, copy.nested.n);
console.log(copy.when instanceof Date, copy.tags.has("a"));
