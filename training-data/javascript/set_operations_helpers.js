const union = (a, b) => new Set([...a, ...b]);
const inter = (a, b) => new Set([...a].filter((x) => b.has(x)));
const diff = (a, b) => new Set([...a].filter((x) => !b.has(x)));
const A = new Set([1, 2, 3]), B = new Set([2, 3, 4]);
console.log(union(A, B), inter(A, B), diff(A, B));
