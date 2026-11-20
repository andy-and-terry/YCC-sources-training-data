// Wilson's theorem primality test.
function wilsonIsPrime(n: number): boolean {
  if (n < 2) return false;
  let fact = 1;
  for (let i = 2; i < n; i++) fact = (fact * i) % n;
  return fact === n - 1;
}
const primes: number[] = [];
for (let n = 2; n < 20; n++) if (wilsonIsPrime(n)) primes.push(n);
console.log(primes);
