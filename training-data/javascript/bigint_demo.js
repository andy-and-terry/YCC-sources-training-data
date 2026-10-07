// BigInt gives arbitrary-precision integers; it cannot be mixed with Number.
console.log(Number.MAX_SAFE_INTEGER + 2);
console.log(BigInt(Number.MAX_SAFE_INTEGER) + 2n);

function factorial(n) {
  let r = 1n;
  for (let i = 2n; i <= n; i++) r *= i;
  return r;
}
console.log(factorial(25n).toString());

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
console.log(modPow(2n, 100n, 1000000007n));

try {
  console.log(1n + 1);
} catch (e) {
  console.log(e.constructor.name);
}
console.log(7n / 2n, typeof 7n, 2n ** 64n);
console.log(BigInt.asUintN(8, 257n), 10n > 9, 10n == 10);
