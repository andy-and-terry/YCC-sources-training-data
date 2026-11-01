import 'dart:math';

// n is triangular iff 8n + 1 is a perfect square.
bool isTriangular(int n) {
  final s = 8 * n + 1;
  final r = sqrt(s).round();
  return r * r == s;
}

void main() {
  print([for (var n = 0; n <= 20; n++) if (isTriangular(n)) n].join(' '));
}
