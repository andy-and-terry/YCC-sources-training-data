// Positive integers expressible as a*a + b*b with a, b >= 0.
function representable(n: number): boolean {
  for (let a = 0; a * a <= n; a++) {
    const b2 = n - a * a;
    const b = Math.round(Math.sqrt(b2));
    if (b * b === b2) return true;
  }
  return false;
}
const out: number[] = [];
for (let n = 1; n <= 30; n++) if (representable(n)) out.push(n);
console.log(out.join(" "));
