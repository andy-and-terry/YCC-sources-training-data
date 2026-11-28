const original = { when: new Date(0), tags: new Set(["a"]), nested: { n: [1, 2] } };
const copy = structuredClone(original);
copy.nested.n.push(3);
console.log(original.nested.n, copy.nested.n, copy.when instanceof Date);
