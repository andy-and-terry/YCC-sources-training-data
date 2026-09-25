function isqrt(n) {
  n = BigInt(n);
  if (n < 0n) throw new RangeError("negative");
  if (n < 2n) return n;
  let x = n;
  let y = (x + 1n) / 2n;
  while (y < x) {
    x = y;
    y = (x + n / x) / 2n;
  }
  return x;
}

for (const n of [0n, 1n, 15n, 16n, 17n, 10n ** 40n + 12345n]) console.log(String(n), String(isqrt(n)));
module.exports = { isqrt };
