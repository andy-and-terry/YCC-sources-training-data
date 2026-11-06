// Fermat primality test; Carmichael number 561 fools it.
function powmod(base: bigint, exp: bigint, mod: bigint): bigint {
  let result = 1n;
  base %= mod;
  while (exp > 0n) {
    if (exp & 1n) result = (result * base) % mod;
    base = (base * base) % mod;
    exp >>= 1n;
  }
  return result;
}

const probablyPrime = (n: bigint): boolean => n > 2n && powmod(2n, n - 1n, n) === 1n;

for (const n of [97n, 91n, 561n]) console.log(String(n), probablyPrime(n));
