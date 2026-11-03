import 'dart:math';

bool isPerfectSquare(int n) {
  if (n < 0) return false;
  final r = sqrt(n).round();
  return r * r == n;
}

void main() => print([for (var n = 0; n < 30; n++) if (isPerfectSquare(n)) n]);
