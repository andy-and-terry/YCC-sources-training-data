bool canBreak(String s, Set<String> dict) {
  final n = s.length;
  final dp = List<bool>.filled(n + 1, false);
  dp[0] = true;
  for (var i = 1; i <= n; i++) {
    for (var j = 0; j < i; j++) {
      if (dp[j] && dict.contains(s.substring(j, i))) {
        dp[i] = true;
        break;
      }
    }
  }
  return dp[n];
}

void main() {
  final dict = {'leet', 'code', 'sand', 'and', 'cats', 'dog'};
  print(canBreak('leetcode', dict));
  print(canBreak('catsandog', dict));
}
