// Emirps: primes whose digit reversal is a different prime.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};

const reverse = (n: number): number => Number([...String(n)].reverse().join(""));

const emirps: number[] = [];
for (let n = 2; n < 100; n++) {
  if (reverse(n) !== n && isPrime(n) && isPrime(reverse(n))) emirps.push(n);
}
console.log(emirps);
