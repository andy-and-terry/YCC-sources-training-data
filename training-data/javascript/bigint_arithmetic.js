const big = 2n ** 100n;
console.log(big);
console.log(big.toString().length, typeof big);

console.log(Number.MAX_SAFE_INTEGER + 2, BigInt(Number.MAX_SAFE_INTEGER) + 2n);

console.log(7n / 2n, -7n / 2n, 7n % 3n);

function factorial(n) {
  let result = 1n;
  for (let i = 2n; i <= n; i++) result *= i;
  return result;
}
console.log(factorial(25n));

function modPow(base, exp, mod) {
  let result = 1n;
  base %= mod;
  while (exp > 0n) {
    if (exp & 1n) result = (result * base) % mod;
    base = (base * base) % mod;
    exp >>= 1n;
  }
  return result;
}
console.log(modPow(4n, 13n, 497n));

console.log(1n === 1, 1n == 1, 2n > 1, 1n < 1.5);
console.log(BigInt.asUintN(8, 257n), BigInt.asIntN(8, 255n));
console.log((255n).toString(16), BigInt("0xff"));

try {
  console.log(1n + 1);
} catch (e) {
  console.log(e.constructor.name);
}
