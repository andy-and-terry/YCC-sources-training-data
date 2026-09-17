proc subsetSum(nums: seq[int], target: int): bool =
  var dp = newSeq[bool](target + 1)
  dp[0] = true
  for num in nums:
    for s in countdown(target, num):
      if dp[s - num]:
        dp[s] = true
  result = dp[target]

echo subsetSum(@[3, 34, 4, 12, 5, 2], 9)
echo subsetSum(@[3, 34, 4, 12, 5, 2], 30)
