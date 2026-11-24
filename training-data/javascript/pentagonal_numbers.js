// Pentagonal numbers: n(3n-1)/2.
const out = [];
for (let n = 1; n <= 10; n++) out.push((n * (3 * n - 1)) / 2);
console.log(out.join(" "));
