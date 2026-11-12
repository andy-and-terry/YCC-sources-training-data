const nested = [1, [2, [3, [4]]]];
console.log(nested.flat(Infinity));
console.log(["a b", "c"].flatMap((s) => s.split(" ")));
const chunk = (a, n) => Array.from({ length: Math.ceil(a.length / n) }, (_, i) => a.slice(i * n, i * n + n));
console.log(chunk([1, 2, 3, 4, 5], 2));
