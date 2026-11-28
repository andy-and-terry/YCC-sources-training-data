int sigma(int n) {
  var s = 0;
  for (var d = 1; d <= n; d++) {
    if (n % d == 0) s += d;
  }
  return s;
}

void main() {
  print([for (var n = 1; n <= 20; n++) if (sigma(n) < 2 * n) n]);
}
