// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
const gcd = (a: number, b: number): number => (b === 0 ? a : gcd(b, a % b));
function phi(n: number): number {
  let c = 0;
  for (let k = 1; k <= n; k++) if (gcd(k, n) === 1) c++;
  return c;
}
function isPerfectTotient(n: number): boolean {
  let total = 0;
  for (let m = n; m > 1; ) {
    m = phi(m);
    total += m;
  }
  return total === n;
}
const out: number[] = [];
for (let n = 2; n < 200; n++) if (isPerfectTotient(n)) out.push(n);
console.log(out.join(" "));
