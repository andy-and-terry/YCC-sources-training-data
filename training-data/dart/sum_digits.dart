int sumDigits(int n) {
  var m = n;
  var sum = 0;
  while (m > 0) {
    sum += m % 10;
    m ~/= 10;
  }
  return sum;
}

void main() {
  print(sumDigits(12345));
}
