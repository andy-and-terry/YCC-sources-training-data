// Palindromic primes below 200; expect 10.
const isPrime = n => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const found = [];
for (let n = 2; n < 200; n++) {
  if (String(n) === [...String(n)].reverse().join('') && isPrime(n)) found.push(n);
}
console.log(found.join(' '));
console.log(found.length);
