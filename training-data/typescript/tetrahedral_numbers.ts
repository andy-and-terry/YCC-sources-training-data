// Tetrahedral numbers n(n+1)(n+2)/6
const term = (n: number): number => ((n * (n + 1)) * (n + 2))/6;

console.log(Array.from({ length: 10 }, (_, n) => term(n)).join(" "));
