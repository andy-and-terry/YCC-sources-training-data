// Goldbach partitions of 100; expect 6.
const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
};
const partitions = (n: number): Array<[number, number]> => {
  const out: Array<[number, number]> = [];
  for (let p = 2; p <= n / 2; p++) if (isPrime(p) && isPrime(n - p)) out.push([p, n - p]);
  return out;
};
console.log(partitions(100).length);
