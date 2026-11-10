const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};
const found: number[] = [];
for (let p = 2; found.length < 10; p++) {
  if (isPrime(p) && isPrime(2 * p + 1)) found.push(p);
}
console.log(found.join(" ")); // 2 3 5 11 23 29 41 53 83 89
