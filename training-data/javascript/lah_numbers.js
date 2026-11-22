// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
const fact = (n) => (n <= 1 ? 1 : n * fact(n - 1));
const comb = (n, k) => fact(n) / (fact(k) * fact(n - k));
const n = 5;
const row = [];
for (let k = 1; k <= n; k++) row.push((comb(n - 1, k - 1) * fact(n)) / fact(k));
console.log(row.join(" "));
