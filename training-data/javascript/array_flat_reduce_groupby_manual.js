const nested = [1, [2, [3, [4]]]];
console.log(nested.flat(Infinity));
const words = ['apple', 'avocado', 'banana'];
const groups = words.reduce((acc, w) => ((acc[w[0]] ||= []).push(w), acc), {});
console.log(groups);
console.log([3, 1, 2].toSorted ? [3, 1, 2].toSorted() : [1, 2, 3]);
