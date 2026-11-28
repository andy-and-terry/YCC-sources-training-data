proc minimumTotal(t: seq[seq[int]]): int =
  var dp = t[^1]
  for r in countdown(t.len - 2, 0):
    for i in 0 ..< t[r].len:
      dp[i] = t[r][i] + min(dp[i], dp[i + 1])
  dp[0]

echo minimumTotal(@[@[2], @[3, 4], @[6, 5, 7], @[4, 1, 8, 3]]) # 11
