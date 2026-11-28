const gcd = (a: bigint, b: bigint): bigint => (b === 0n ? a : gcd(b, a % b));

function rho(n: bigint): bigint {
  if (n % 2n === 0n) return 2n;
  const f = (v: bigint): bigint => (v * v + 1n) % n;
  let x = 2n, y = 2n, d = 1n;
  while (d === 1n) {
    x = f(x);
    y = f(f(y));
    d = gcd(x > y ? x - y : y - x, n);
  }
  return d;
}

const n = 8051n;
const p = rho(n);
console.log(`${n} = ${p} * ${n / p}`);
