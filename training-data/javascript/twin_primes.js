// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
const isPrime = (n) => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const out = [];
for (let p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) out.push(p);
console.log(out.join(" "));
