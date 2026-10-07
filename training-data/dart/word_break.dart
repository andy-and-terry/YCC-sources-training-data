bool canSegment(String s, Set<String> dictionary) {
  final dp = List<bool>.filled(s.length + 1, false);
  dp[0] = true;

  for (var i = 1; i <= s.length; i++) {
    for (var j = 0; j < i; j++) {
      if (dp[j] && dictionary.contains(s.substring(j, i))) {
        dp[i] = true;
        break;
      }
    }
  }

  return dp[s.length];
}

void main() {
  final dict = {'leet', 'code'};
  print(canSegment('leetcode', dict));
  print(canSegment('leetcodex', dict));
}
