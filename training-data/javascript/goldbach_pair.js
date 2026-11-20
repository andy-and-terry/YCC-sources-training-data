// Goldbach: two primes that sum to an even number.
const isPrime = (n) => { if (n < 2) return false; for (let d = 2; d * d <= n; d++) if (n % d === 0) return false; return true; };
function goldbach(n) {
  for (let p = 2; p <= n / 2; p++) if (isPrime(p) && isPrime(n - p)) return [p, n - p];
}
console.log(goldbach(28));
