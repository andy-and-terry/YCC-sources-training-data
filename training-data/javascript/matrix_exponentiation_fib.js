const MOD = 1000000007n;

function mul(a, b) {
  return [
    [(a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD, (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD],
    [(a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD, (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD],
  ];
}

function fib(n) {
  let n2 = BigInt(n);
  let result = [[1n, 0n], [0n, 1n]];
  let m = [[1n, 1n], [1n, 0n]];
  while (n2 > 0n) {
    if (n2 & 1n) result = mul(result, m);
    m = mul(m, m);
    n2 >>= 1n;
  }
  return result[0][1];
}

console.log(Array.from({ length: 15 }, (_, i) => fib(i)).join(" "));
console.log("fib(10^18) mod 1e9+7 =", fib(10n ** 18n));
module.exports = { fib };
