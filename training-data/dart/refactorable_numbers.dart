int tau(int n) => [for (var d = 1; d <= n; d++) if (n % d == 0) d].length;

void main() {
  final out = [for (var n = 1; n < 60; n++) if (n % tau(n) == 0) n];
  print(out.join(' ')); // 1 2 8 9 12 18 24 36 40 56
}
