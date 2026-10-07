export function powMod(base: bigint, exp: bigint, mod: bigint): bigint {
  if (mod === 1n) return 0n;
  let result = 1n;
  base %= mod;
  while (exp > 0n) {
    if (exp & 1n) result = (result * base) % mod;
    base = (base * base) % mod;
    exp >>= 1n;
  }
  return result;
}

/** Fermat test using fast modular exponentiation. */
export const probablyPrime = (n: bigint): boolean =>
  n > 3n ? [2n, 3n, 5n, 7n].every((a) => powMod(a, n - 1n, n) === 1n) : n >= 2n;

console.log(powMod(2n, 10n, 1000n), powMod(3n, 200n, 13n), powMod(7n, 10n ** 18n, 1_000_000_007n));
console.log([97n, 561n, 1_000_000_007n].map(probablyPrime));
