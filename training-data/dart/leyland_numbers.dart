import 'dart:math';

// Leyland numbers: x^y + y^x for x >= y >= 2.
int leyland(int x, int y) => pow(x, y).toInt() + pow(y, x).toInt();

void main() {
  final vals = <int>[];
  for (var x = 2; x <= 4; x++) {
    for (var y = 2; y <= x; y++) {
      vals.add(leyland(x, y));
    }
  }
  print(vals.join(' '));
}
