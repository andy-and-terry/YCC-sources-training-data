proc longestCommonSubstring(a, b: string): int =
  let n = a.len
  let m = b.len
  var dp = newSeq[seq[int]](n + 1)
  for i in 0 .. n:
    dp[i] = newSeq[int](m + 1)
  var best = 0
  for i in 1 .. n:
    for j in 1 .. m:
      if a[i - 1] == b[j - 1]:
        dp[i][j] = dp[i - 1][j - 1] + 1
        best = max(best, dp[i][j])
  result = best

echo longestCommonSubstring("abcdef", "zabcz")
echo longestCommonSubstring("abc", "def")
