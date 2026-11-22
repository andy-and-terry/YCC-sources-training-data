// Sophie Germain primes: p prime and 2p + 1 prime.
function isPrime(n: number): boolean {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
}
const out: number[] = [];
for (let p = 2; p < 100; p++) if (isPrime(p) && isPrime(2 * p + 1)) out.push(p);
console.log(out.join(" "));
