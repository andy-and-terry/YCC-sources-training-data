// Emirps: primes whose digit reversal is a different prime.
function isPrime(n: number): boolean {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
}
function isEmirp(n: number): boolean {
  const r = Number(String(n).split("").reverse().join(""));
  return r !== n && isPrime(n) && isPrime(r);
}
const out: number[] = [];
for (let n = 2; n < 200; n++) if (isEmirp(n)) out.push(n);
console.log(out.join(" "));
