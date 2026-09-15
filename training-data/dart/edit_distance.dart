int editDistance(String a, String b) {
  final m = a.length;
  final n = b.length;
  final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));

  for (var i = 0; i <= m; i++) {
    dp[i][0] = i;
  }
  for (var j = 0; j <= n; j++) {
    dp[0][j] = j;
  }

  for (var i = 1; i <= m; i++) {
    for (var j = 1; j <= n; j++) {
      if (a[i - 1] == b[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        final replace = dp[i - 1][j - 1];
        final delete = dp[i - 1][j];
        final insert = dp[i][j - 1];
        dp[i][j] = 1 + [replace, delete, insert].reduce((x, y) => x < y ? x : y);
      }
    }
  }

  return dp[m][n];
}

void main() {
  print(editDistance('kitten', 'sitting'));
}
