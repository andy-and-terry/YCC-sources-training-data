// Twin primes below 100; expect 8.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const twins: [number, number][] = [];
for (let p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) twins.push([p, p + 2]);
console.log(twins.length);
