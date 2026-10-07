enum TriangleKind { equilateral, isosceles, scalene, invalid }

TriangleKind classify(double a, double b, double c) {
  final s = [a, b, c]..sort();
  if (s[0] <= 0 || s[0] + s[1] <= s[2]) return TriangleKind.invalid;
  return switch ({a, b, c}.length) {
    1 => TriangleKind.equilateral,
    2 => TriangleKind.isosceles,
    _ => TriangleKind.scalene,
  };
}

void main() {
  for (final (a, b, c) in [(3.0, 3.0, 3.0), (3.0, 4.0, 4.0), (3.0, 4.0, 5.0), (1.0, 1.0, 3.0)]) {
    print(classify(a, b, c).name);
  }
}
