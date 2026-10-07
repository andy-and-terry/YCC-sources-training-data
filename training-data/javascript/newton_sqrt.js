function newtonSqrt(x, tol = 1e-12) {
  if (x < 0) throw new RangeError("negative input");
  if (x === 0) return 0;
  let guess = x >= 1 ? x : 1;
  for (;;) {
    const next = 0.5 * (guess + x / guess);
    if (Math.abs(next - guess) < tol) return next;
    guess = next;
  }
}

function newtonCbrt(x, tol = 1e-12) {
  let g = x || 1;
  for (;;) {
    const next = g - (g * g * g - x) / (3 * g * g);
    if (Math.abs(next - g) < tol) return next;
    g = next;
  }
}

for (const v of [2, 9, 0.25, 1e10]) console.log(v, newtonSqrt(v));
console.log("cbrt(27) =", newtonCbrt(27));
module.exports = { newtonSqrt, newtonCbrt };
