bool wordBreak(String s, List<String> wordDict) {
  final words = wordDict.toSet();
  final dp = List.filled(s.length + 1, false);
  dp[0] = true;

  for (var i = 1; i <= s.length; i++) {
    for (var j = 0; j < i; j++) {
      if (dp[j] && words.contains(s.substring(j, i))) {
        dp[i] = true;
        break;
      }
    }
  }

  return dp[s.length];
}

void main() {
  print(wordBreak('leetcode', ['leet', 'code']));
  print(wordBreak('applepenapple', ['apple', 'pen']));
  print(wordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat']));
}
