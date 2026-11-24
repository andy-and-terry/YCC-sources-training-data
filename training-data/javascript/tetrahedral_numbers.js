// Tetrahedral numbers: n(n+1)(n+2)/6, running sums of triangular numbers.
const out = [];
for (let n = 1; n <= 10; n++) out.push((n * (n + 1) * (n + 2)) / 6);
console.log(out.join(" "));
