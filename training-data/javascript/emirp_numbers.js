// Emirps: primes whose digit reversal is a different prime.
const isPrime = (n) => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const isEmirp = (n) => {
  const r = Number([...String(n)].reverse().join(""));
  return r !== n && isPrime(n) && isPrime(r);
};
const out = [];
for (let n = 2; n < 200; n++) if (isEmirp(n)) out.push(n);
console.log(out.join(" "));
