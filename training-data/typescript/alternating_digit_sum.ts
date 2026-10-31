function alternatingDigitSum(n: number): number {
  let total = 0;
  let sign = 1;
  while (n > 0) {
    total += sign * (n % 10);
    sign = -sign;
    n = Math.floor(n / 10);
  }
  return total;
}

for (const n of [1234, 99999, 1000]) console.log(n, alternatingDigitSum(n));
