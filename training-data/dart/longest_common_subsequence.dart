String longestCommonSubsequence(String a, String b) {
  final m = a.length;
  final n = b.length;
  final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));

  for (var i = 1; i <= m; i++) {
    for (var j = 1; j <= n; j++) {
      if (a[i - 1] == b[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
      } else {
        dp[i][j] = dp[i - 1][j] > dp[i][j - 1] ? dp[i - 1][j] : dp[i][j - 1];
      }
    }
  }

  final buffer = StringBuffer();
  var i = m, j = n;
  final result = <String>[];
  while (i > 0 && j > 0) {
    if (a[i - 1] == b[j - 1]) {
      result.add(a[i - 1]);
      i--;
      j--;
    } else if (dp[i - 1][j] > dp[i][j - 1]) {
      i--;
    } else {
      j--;
    }
  }

  for (final c in result.reversed) {
    buffer.write(c);
  }
  return buffer.toString();
}

void main() {
  print(longestCommonSubsequence('ABCBDAB', 'BDCABA'));
}
