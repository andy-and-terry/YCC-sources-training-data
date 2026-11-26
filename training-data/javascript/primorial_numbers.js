// Primorials (product of first k primes) up to 1e6; expect 8 including 1.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const out = [1];
let value = 1;
for (let p = 2; ; p++) {
  if (!isPrime(p)) continue;
  value *= p;
  if (value > 1e6) break;
  out.push(value);
}
console.log(out.join(' '));
console.log(out.length);
