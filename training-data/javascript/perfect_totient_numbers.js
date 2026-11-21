// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
const gcd = (a, b) => (b === 0 ? a : gcd(b, a % b));
function phi(n) {
  let c = 0;
  for (let k = 1; k <= n; k++) if (gcd(k, n) === 1) c++;
  return c;
}
function isPerfectTotient(n) {
  let total = 0;
  for (let m = n; m > 1; ) {
    m = phi(m);
    total += m;
  }
  return total === n;
}
const out = [];
for (let n = 2; n < 200; n++) if (isPerfectTotient(n)) out.push(n);
console.log(out.join(" "));
