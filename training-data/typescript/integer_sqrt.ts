export function isqrt(n: bigint): bigint {
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

export const isPerfectSquare = (n: bigint): boolean => {
  const r = isqrt(n);
  return r * r === n;
};

for (const n of [0n, 1n, 15n, 16n, 17n, 10n ** 40n + 12345n]) console.log(`${n} -> ${isqrt(n)}`);
console.log(isPerfectSquare(152415787532388367501905199875019052100n));
