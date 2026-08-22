function gcd(a, b) {
  while (b) [a, b] = [b, a % b];
  return Math.abs(a);
}

function lcm(a, b) {
  return a && b ? Math.abs(a * b) / gcd(a, b) : 0;
}

console.log(gcd(48, 18), lcm(4, 6));
module.exports = { gcd, lcm };
