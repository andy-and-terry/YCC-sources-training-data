proc minCoins(coins: seq[int], amount: int): int =
  var dp = newSeq[int](amount + 1)
  for i in 1 .. amount:
    dp[i] = -1
  for n in 1 .. amount:
    for c in coins:
      if c <= n and dp[n - c] != -1:
        if dp[n] == -1 or dp[n - c] + 1 < dp[n]:
          dp[n] = dp[n - c] + 1
  result = dp[amount]

echo minCoins(@[1, 2, 5], 11)
