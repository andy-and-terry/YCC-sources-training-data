proc rodCutting(prices: seq[int], n: int): int =
  var dp = newSeq[int](n + 1)
  for i in 1 .. n:
    var best = low(int)
    for cut in 1 .. i:
      best = max(best, prices[cut - 1] + dp[i - cut])
    dp[i] = best
  result = dp[n]

let prices = @[1, 5, 8, 9, 10, 17, 17, 20]
echo rodCutting(prices, 8)
