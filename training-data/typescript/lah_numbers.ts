const fact = (n: bigint): bigint => (n <= 1n ? 1n : n * fact(n - 1n));
const comb = (n: bigint, k: bigint): bigint => fact(n) / (fact(k) * fact(n - k));
const lah = (n: bigint, k: bigint): bigint => (comb(n - 1n, k - 1n) * fact(n)) / fact(k);

for (let n = 1n; n <= 5n; n++) {
  const row: bigint[] = [];
  for (let k = 1n; k <= n; k++) row.push(lah(n, k));
  console.log(row.join(" "));
}
