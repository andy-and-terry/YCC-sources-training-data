// Möbius function: 0 if n has a squared prime factor, else (-1)^k for k distinct primes.
function mobius(n: number): number {
  let result = 1;
  for (let p = 2; p * p <= n; p++) {
    if (n % p === 0) {
      n /= p;
      if (n % p === 0) return 0;
      result = -result;
    }
  }
  return n > 1 ? -result : result;
}
const out: number[] = [];
for (let n = 1; n <= 30; n++) out.push(mobius(n));
console.log(out.join(" "));
