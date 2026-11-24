// Hexagonal numbers: n(2n-1); every hexagonal number is also triangular.
const out: number[] = [];
for (let n = 1; n <= 10; n++) out.push(n * (2 * n - 1));
console.log(out.join(" "));
