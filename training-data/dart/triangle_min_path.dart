import 'dart:math';

int minimumTotal(List<List<int>> t) {
  final dp = List<int>.of(t.last);
  for (var r = t.length - 2; r >= 0; r--) {
    for (var i = 0; i < t[r].length; i++) {
      dp[i] = t[r][i] + min(dp[i], dp[i + 1]);
    }
  }
  return dp[0];
}

void main() {
  print(minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])); // 11
}
