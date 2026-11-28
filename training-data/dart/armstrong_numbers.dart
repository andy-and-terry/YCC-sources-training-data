import 'dart:math';

bool isArmstrong(int n) {
  final digits = n.toString().split('').map(int.parse).toList();
  final sum = digits.fold<num>(0, (s, d) => s + pow(d, digits.length));
  return sum == n;
}

void main() {
  print([for (var n = 1; n < 1000; n++) if (isArmstrong(n)) n]);
  // [1, 2, 3, 4, 5, 6, 7, 8, 9, 153, 370, 371, 407]
}
