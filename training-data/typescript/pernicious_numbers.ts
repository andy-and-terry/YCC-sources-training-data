// Pernicious numbers: popcount is prime.
function isPrime(n: number): boolean {
  if (n < 2) return false;
  for (let d = 2; d * d <= n; d++) if (n % d === 0) return false;
  return true;
}
const popcount = (n: number): number => n.toString(2).split("1").length - 1;
const out: number[] = [];
for (let n = 1; n <= 20; n++) if (isPrime(popcount(n))) out.push(n);
console.log(out.join(" "));
