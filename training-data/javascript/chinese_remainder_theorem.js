function extGCD(a, b) {
  if (b === 0) return [a, 1, 0];
  const [g, x1, y1] = extGCD(b, a % b);
  return [g, y1, x1 - Math.floor(a / b) * y1];
}

// Solves x = remainders[i] (mod moduli[i]) for all i, assuming the
// moduli are pairwise coprime.
function crt(remainders, moduli) {
  const prod = moduli.reduce((acc, m) => acc * m, 1);
  let result = 0;
  for (let i = 0; i < moduli.length; i++) {
    const partial = prod / moduli[i];
    const [, inv] = extGCD(partial, moduli[i]);
    result += remainders[i] * partial * inv;
  }
  result %= prod;
  if (result < 0) result += prod;
  return result;
}

console.log('x =', crt([2, 3, 2], [3, 5, 7]));
module.exports = { crt };
