double area(List<(double, double)> p) {
  var s = 0.0;
  for (var i = 0; i < p.length; i++) {
    final (x1, y1) = p[i];
    final (x2, y2) = p[(i + 1) % p.length];
    s += x1 * y2 - x2 * y1;
  }
  return s.abs() / 2;
}

void main() => print(area([(0, 0), (4, 0), (4, 3), (0, 3)]));
