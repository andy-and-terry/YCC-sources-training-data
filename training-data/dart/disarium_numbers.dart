// Disarium numbers: digits raised to their 1-based positions sum to n.
int power(int b, int e) {
  var r = 1;
  for (var i = 0; i < e; i++) r *= b;
  return r;
}

bool isDisarium(int n) {
  final digits = n.toString().split('').map(int.parse).toList();
  var sum = 0;
  for (var i = 0; i < digits.length; i++) {
    sum += power(digits[i], i + 1);
  }
  return sum == n;
}

void main() {
  print([for (var n = 1; n < 1000; n++) if (isDisarium(n)) n].join(' '));
}
