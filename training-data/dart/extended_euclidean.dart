List<int> extendedGcd(int a, int b) {
  if (b == 0) return [a, 1, 0];

  final result = extendedGcd(b, a % b);
  final g = result[0];
  final x1 = result[1];
  final y1 = result[2];

  return [g, y1, x1 - (a ~/ b) * y1];
}

void main() {
  final result = extendedGcd(35, 15);
  print('gcd=${result[0]} x=${result[1]} y=${result[2]}');
}
