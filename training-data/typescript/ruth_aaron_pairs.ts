// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
function sopfr(n: number): number {
  let total = 0;
  for (let p = 2; p * p <= n; p++) {
    while (n % p === 0) { total += p; n /= p; }
  }
  return total + (n > 1 ? n : 0);
}
const out: number[] = [];
for (let n = 2; n < 110; n++) if (sopfr(n) === sopfr(n + 1)) out.push(n);
console.log(out.join(" "));
