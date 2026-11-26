// Emirps below 200: primes whose reversal is a different prime; expect 15.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const rev = n => Number([...String(n)].reverse().join(''));
const emirps = [];
for (let n = 2; n < 200; n++) if (isPrime(n) && rev(n) !== n && isPrime(rev(n))) emirps.push(n);
console.log(emirps.join(' '));
console.log(emirps.length);
