int centralDelannoy(int n) {
  final g = List.generate(n + 1, (_) => List<int>.filled(n + 1, 1));
  for (var i = 1; i <= n; i++) {
    for (var j = 1; j <= n; j++) {
      g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
    }
  }
  return g[n][n];
}

void main() {
  print(List.generate(6, centralDelannoy).join(' ')); // 1 3 13 63 321 1683
}
