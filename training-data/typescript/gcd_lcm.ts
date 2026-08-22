function gcd(a: number, b: number): number {
  while (b) [a, b] = [b, a % b];
  return Math.abs(a);
}

function lcm(a: number, b: number): number {
  return a && b ? Math.abs(a * b) / gcd(a, b) : 0;
}

console.log(gcd(48, 18), lcm(4, 6));
