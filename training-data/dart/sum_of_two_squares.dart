import 'dart:math';

// Positive n expressible as a*a + b*b with a, b >= 0.
bool representable(int n) {
  for (var a = 0; a * a <= n; a++) {
    final b = sqrt(n - a * a).round();
    if (a * a + b * b == n) return true;
  }
  return false;
}

void main() {
  print([for (var n = 1; n <= 30; n++) if (representable(n)) n].join(' '));
}
