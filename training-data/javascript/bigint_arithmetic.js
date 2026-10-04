function factorial(n) {
  let r = 1n;
  for (let i = 2n; i <= n; i++) r *= i;
  return r;
}

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

console.log(factorial(25n).toString());
console.log(modPow(2n, 1000n, 1000000007n));
console.log(Number.MAX_SAFE_INTEGER + 2, BigInt(Number.MAX_SAFE_INTEGER) + 2n);
console.log(typeof 10n, 7n / 2n);
