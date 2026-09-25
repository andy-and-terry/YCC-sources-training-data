function powMod(base, exp, mod) {
  base = BigInt(base) % BigInt(mod);
  exp = BigInt(exp);
  mod = BigInt(mod);
  let result = 1n;
  while (exp > 0n) {
    if (exp & 1n) result = (result * base) % mod;
    base = (base * base) % mod;
    exp >>= 1n;
  }
  return result;
}

console.log(powMod(2, 10, 1000), powMod(3, 200, 13), powMod(7, 10n ** 18n, 1000000007));
module.exports = { powMod };
