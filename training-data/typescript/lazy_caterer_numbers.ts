// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
const pieces = (n: number): number => (n * (n + 1)) / 2 + 1;
console.log(Array.from({ length: 10 }, (_, n) => pieces(n)).join(" "));
