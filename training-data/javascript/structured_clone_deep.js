const orig = { d: new Date(0), s: new Set([1, 2]), nested: { a: [1, 2] } };
const copy = structuredClone(orig);
copy.nested.a.push(3);
console.log(orig.nested.a, copy.nested.a, copy.s.has(2));
