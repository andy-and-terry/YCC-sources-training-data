// Shoelace polygon area with records.
double area(List<(double, double)> p) {
  var s = 0.0;
  for (var i = 0; i < p.length; i++) {
    final q = p[(i + 1) % p.length];
    s += p[i].$1 * q.$2 - q.$1 * p[i].$2;
  }
  return s.abs() / 2;
}

void main() => print(area([(0, 0), (4, 0), (4, 3), (0, 3)]));
