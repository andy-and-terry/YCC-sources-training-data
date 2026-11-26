// Circular primes below 100 (every digit rotation prime); expect 13.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const circular = n => {
  const s = String(n);
  return [...s].every((_, i) => isPrime(Number(s.slice(i) + s.slice(0, i))));
};
let count = 0;
for (let n = 2; n < 100; n++) if (circular(n)) count++;
console.log(count);
