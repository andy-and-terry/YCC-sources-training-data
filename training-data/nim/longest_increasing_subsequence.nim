proc lengthOfLIS(nums: seq[int]): int =
  if nums.len == 0:
    return 0
  var dp = newSeq[int](nums.len)
  for i in 0 ..< nums.len:
    dp[i] = 1
    for j in 0 ..< i:
      if nums[j] < nums[i] and dp[j] + 1 > dp[i]:
        dp[i] = dp[j] + 1
  result = dp[0]
  for i in 1 ..< dp.len:
    if dp[i] > result:
      result = dp[i]

echo lengthOfLIS(@[10, 9, 2, 5, 3, 7, 101, 18])
echo lengthOfLIS(@[0, 1, 0, 3, 2, 3])
echo lengthOfLIS(@[7, 7, 7, 7])
