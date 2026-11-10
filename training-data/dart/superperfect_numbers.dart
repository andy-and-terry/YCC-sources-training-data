int sigma(int n) {
  var s = 0;
  for (var d = 1; d <= n; d++) {
    if (n % d == 0) s += d;
  }
  return s;
}

void main() {
  final out = [for (var n = 1; n < 100; n++) if (sigma(sigma(n)) == 2 * n) n];
  print(out.join(' ')); // 2 4 16 64
}
