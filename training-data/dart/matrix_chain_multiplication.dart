int minMultiplications(List<int> dims) {
  final n = dims.length - 1;
  final dp = List.generate(n + 1, (_) => List<int>.filled(n + 1, 0));

  for (var len = 2; len <= n; len++) {
    for (var i = 1; i <= n - len + 1; i++) {
      final j = i + len - 1;
      dp[i][j] = 1 << 30;
      for (var k = i; k < j; k++) {
        final cost = dp[i][k] + dp[k + 1][j] + dims[i - 1] * dims[k] * dims[j];
        if (cost < dp[i][j]) dp[i][j] = cost;
      }
    }
  }

  return dp[1][n];
}

void main() {
  print(minMultiplications([40, 20, 30, 10, 30]));
}
