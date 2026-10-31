int alternatingDigitSum(int n) {
  var total = 0, sign = 1;
  while (n > 0) {
    total += sign * (n % 10);
    sign = -sign;
    n ~/= 10;
  }
  return total;
}

void main() {
  for (final n in [1234, 99999, 1000]) {
    print('$n ${alternatingDigitSum(n)}');
  }
}
