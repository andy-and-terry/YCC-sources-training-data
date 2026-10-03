// Returns [g, x, y] such that a*x + b*y = g = gcd(a, b).
function extendedGCD(a, b) {
  if (b === 0) return [a, 1, 0];
  const [g, x1, y1] = extendedGCD(b, a % b);
  return [g, y1, x1 - Math.floor(a / b) * y1];
}

const [a, b] = [35, 15];
const [g, x, y] = extendedGCD(a, b);
console.log(`gcd(${a}, ${b}) = ${g}`);
console.log(`${a}*${x} + ${b}*${y} = ${a * x + b * y}`);
module.exports = { extendedGCD };
