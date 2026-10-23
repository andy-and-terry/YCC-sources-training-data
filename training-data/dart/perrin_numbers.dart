// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
void main() {
  final p = [3, 0, 2];
  for (var n = 3; n < 15; n++) {
    p.add(p[n - 2] + p[n - 3]);
  }
  print(p.join(' '));
}
