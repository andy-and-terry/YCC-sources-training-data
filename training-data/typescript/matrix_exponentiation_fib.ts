type Mat2 = [[bigint, bigint], [bigint, bigint]];
const MOD = 1_000_000_007n;

function mul(a: Mat2, b: Mat2): Mat2 {
  return [
    [(a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD, (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD],
    [(a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD, (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD],
  ];
}

export function fib(n: bigint): bigint {
  let result: Mat2 = [[1n, 0n], [0n, 1n]];
  let m: Mat2 = [[1n, 1n], [1n, 0n]];
  for (; n > 0n; n >>= 1n) {
    if (n & 1n) result = mul(result, m);
    m = mul(m, m);
  }
  return result[0][1];
}

console.log(Array.from({ length: 15 }, (_, i) => fib(BigInt(i))).join(" "));
console.log("fib(10^18) mod 1e9+7 =", fib(10n ** 18n).toString());
