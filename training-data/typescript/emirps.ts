// Emirps below 200; expect 15.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const rev = (n: number): number => Number(String(n).split('').reverse().join(''));
const emirps: number[] = [];
for (let n = 2; n < 200; n++) if (isPrime(n) && rev(n) !== n && isPrime(rev(n))) emirps.push(n);
console.log(emirps.length, emirps.join(' '));
