proc matrixChainOrder(dims: seq[int]): int =
  let n = dims.len - 1
  var dp = newSeq[seq[int]](n)
  for i in 0 ..< n:
    dp[i] = newSeq[int](n)
  for length in 2 .. n:
    for i in 0 .. n - length:
      let j = i + length - 1
      dp[i][j] = high(int)
      for k in i ..< j:
        let cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1]
        if cost < dp[i][j]:
          dp[i][j] = cost
  result = dp[0][n - 1]

echo matrixChainOrder(@[40, 20, 30, 10, 30])
echo matrixChainOrder(@[10, 20, 30])
