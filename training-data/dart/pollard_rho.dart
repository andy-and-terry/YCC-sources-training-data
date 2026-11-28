int gcd(int a, int b) => b == 0 ? a : gcd(b, a % b);

int rho(int n) {
  if (n.isEven) return 2;
  int f(int v) => (v * v + 1) % n;
  var x = 2, y = 2, d = 1;
  while (d == 1) {
    x = f(x);
    y = f(f(y));
    d = gcd((x - y).abs(), n);
  }
  return d;
}

void main() {
  const n = 8051;
  final p = rho(n);
  print('$n = $p * ${n ~/ p}');
}
