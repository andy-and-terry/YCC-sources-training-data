// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
const fact = (n: number): number => (n <= 1 ? 1 : n * fact(n - 1));
const comb = (n: number, k: number): number => fact(n) / (fact(k) * fact(n - k));
const lah = (n: number, k: number): number => (comb(n - 1, k - 1) * fact(n)) / fact(k);
const n = 5;
console.log(Array.from({ length: n }, (_, i) => lah(n, i + 1)).join(" "));
