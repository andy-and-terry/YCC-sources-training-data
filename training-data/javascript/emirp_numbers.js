// Emirps: primes whose digit reversal is a different prime.
const isPrime = (n) => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};

const reverse = (n) => Number([...String(n)].reverse().join(""));

const emirps = Array.from({ length: 98 }, (_, i) => i + 2)
  .filter((n) => reverse(n) !== n && isPrime(n) && isPrime(reverse(n)));

console.log(emirps.join(" "));
