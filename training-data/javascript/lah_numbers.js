const fact = (n) => (n <= 1n ? 1n : n * fact(n - 1n));
const comb = (n, k) => fact(n) / (fact(k) * fact(n - k));
const lah = (n, k) => (comb(n - 1n, k - 1n) * fact(n)) / fact(k);

for (let n = 1n; n <= 5n; n++) {
  const row = [];
  for (let k = 1n; k <= n; k++) row.push(lah(n, k));
  console.log(row.join(" "));
}
