// Palindromic primes below 200; expect 10.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const found: number[] = [];
for (let n = 2; n < 200; n++) {
  const s = String(n);
  if (s === s.split('').reverse().join('') && isPrime(n)) found.push(n);
}
console.log(found.length, found.join(' '));
