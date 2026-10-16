const union = (a, b) => new Set([...a, ...b]);
const intersection = (a, b) => new Set([...a].filter((x) => b.has(x)));
const difference = (a, b) => new Set([...a].filter((x) => !b.has(x)));
const symmetricDifference = (a, b) => difference(union(a, b), intersection(a, b));
const isSubset = (a, b) => [...a].every((x) => b.has(x));

const a = new Set([1, 2, 3, 4]);
const b = new Set([3, 4, 5]);

console.log(union(a, b));
console.log(intersection(a, b));
console.log(difference(a, b));
console.log(symmetricDifference(a, b));
console.log(isSubset(new Set([3, 4]), a));
