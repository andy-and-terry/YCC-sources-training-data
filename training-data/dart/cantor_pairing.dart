import 'dart:math';

// Cantor pairing function and its inverse.
int pair(int x, int y) => (x + y) * (x + y + 1) ~/ 2 + y;

(int, int) unpair(int z) {
  final w = (sqrt(8 * z + 1).floor() - 1) ~/ 2;
  final y = z - w * (w + 1) ~/ 2;
  return (w - y, y);
}

void main() {
  print(pair(3, 4));
  final (x, y) = unpair(32);
  print('$x $y');
}
