// Reverse-and-add until a palindrome; count the steps.
BigInt reverseDigits(BigInt n) =>
    BigInt.parse(n.toString().split('').reversed.join());

int steps(int start) {
  var n = BigInt.from(start);
  for (var count = 0; count < 100; count++) {
    if (count > 0 && n == reverseDigits(n)) return count;
    n += reverseDigits(n);
  }
  return -1;
}

void main() {
  print([56, 57, 59, 79, 89].map(steps).join(' '));
}
