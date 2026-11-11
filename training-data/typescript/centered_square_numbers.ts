// Centered square numbers 2n(n+1)+1
const term = (n: number): number => ((2 * n) * (n + 1)) + 1;

console.log(Array.from({ length: 10 }, (_, n) => term(n)).join(" "));
