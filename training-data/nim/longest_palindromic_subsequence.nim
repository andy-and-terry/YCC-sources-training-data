proc longestPalindromicSubsequence(s: string): int =
  let n = s.len
  if n == 0:
    return 0
  var dp = newSeq[seq[int]](n)
  for i in 0 ..< n:
    dp[i] = newSeq[int](n)
    dp[i][i] = 1
  for length in 2 .. n:
    for i in 0 .. n - length:
      let j = i + length - 1
      if s[i] == s[j]:
        dp[i][j] = dp[i + 1][j - 1] + 2
      else:
        dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
  result = dp[0][n - 1]

echo longestPalindromicSubsequence("bbbab")
echo longestPalindromicSubsequence("cbbd")
