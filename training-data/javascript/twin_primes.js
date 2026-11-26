// Twin primes below 100: pairs (p, p + 2) both prime; expect 8.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
let count = 0;
for (let p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) count++;
console.log(count);
