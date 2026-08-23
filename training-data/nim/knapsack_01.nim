proc knapsack(weights, values: seq[int], capacity: int): int =
  var dp = newSeq[int](capacity + 1)
  for i in 0 ..< weights.len:
    for cap in countdown(capacity, weights[i]):
      dp[cap] = max(dp[cap], dp[cap - weights[i]] + values[i])
  result = dp[capacity]

echo knapsack(@[2, 3, 4, 5], @[3, 4, 5, 6], 5)
