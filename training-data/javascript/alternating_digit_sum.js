function alternatingDigitSum(n) {
  let total = 0;
  let sign = 1;
  while (n > 0) {
    total += sign * (n % 10);
    sign = -sign;
    n = Math.floor(n / 10);
  }
  return total;
}

[1234, 99999, 1000].forEach((n) => console.log(n, alternatingDigitSum(n)));
