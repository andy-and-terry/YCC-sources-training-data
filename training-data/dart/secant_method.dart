double secant(double Function(double) f, double a, double b) {
  for (var i = 0; i < 50; i++) {
    final fa = f(a), fb = f(b);
    if ((fb - fa).abs() < 1e-15) break;
    final c = b - fb * (b - a) / (fb - fa);
    a = b;
    b = c;
  }
  return b;
}

void main() => print(secant((x) => x * x - 2, 1, 2).toStringAsFixed(8));
