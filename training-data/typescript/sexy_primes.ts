// Sexy primes below 100; expect 16 pairs.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
let count = 0;
for (let p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 6)) count++;
console.log(count);
