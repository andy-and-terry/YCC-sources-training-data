const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};
const rev = (n: number): number => Number([...String(n)].reverse().join(""));

function emirps(limit: number): number[] {
  const out: number[] = [];
  for (let p = 2; p < limit; p++) {
    if (isPrime(p) && rev(p) !== p && isPrime(rev(p))) out.push(p);
  }
  return out;
}

console.log(emirps(100));
