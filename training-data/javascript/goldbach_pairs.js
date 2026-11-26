// Goldbach partitions of 100 into two primes p <= q; expect 6.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const pairs = [];
for (let p = 2; p <= 50; p++) if (isPrime(p) && isPrime(100 - p)) pairs.push([p, 100 - p]);
console.log(JSON.stringify(pairs));
console.log(pairs.length);
