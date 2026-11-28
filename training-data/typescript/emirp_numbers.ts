function isPrime(n: number): boolean {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
}

const reverseNumber = (n: number): number => Number([...String(n)].reverse().join(""));

const emirps: number[] = [];
for (let p = 2; p < 200; p++) {
  const r = reverseNumber(p);
  if (r !== p && isPrime(p) && isPrime(r)) emirps.push(p);
}
console.log(emirps); // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
