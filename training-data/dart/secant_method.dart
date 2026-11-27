double secant(double Function(double) f, double x0, double x1) {
  for (var i = 0; i < 50; i++) {
    final f0 = f(x0), f1 = f(x1);
    if (f1 == f0) break;
    final next = x1 - f1 * (x1 - x0) / (f1 - f0);
    x0 = x1;
    x1 = next;
    if ((x1 - x0).abs() < 1e-12) break;
  }
  return x1;
}

void main() => print(secant((x) => x * x - 2, 1, 2).toStringAsFixed(10));
