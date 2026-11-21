// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
const gcd = (a: number, b: number): number => (b === 0 ? a : gcd(b, a % b));
function powMod(b: number, e: number, m: number): number {
  let r = 1;
  b %= m;
  while (e > 0) {
    if (e & 1) r = (r * b) % m;
    b = (b * b) % m;
    e >>= 1;
  }
  return r;
}
function isPrime(n: number): boolean {
  for (let p = 2; p * p <= n; p++) if (n % p === 0) return false;
  return n > 1;
}
function isCarmichael(n: number): boolean {
  if (isPrime(n)) return false;
  for (let a = 2; a < n; a++) if (gcd(a, n) === 1 && powMod(a, n - 1, n) !== 1) return false;
  return true;
}
const out: number[] = [];
for (let n = 3; n < 3000; n += 2) if (isCarmichael(n)) out.push(n);
console.log(out.join(" "));
