local function longest_increasing_subsequence(nums)
  local n = #nums
  if n == 0 then return 0 end

  local dp = {}
  for i = 1, n do dp[i] = 1 end

  local best = 1
  for i = 2, n do
    for j = 1, i - 1 do
      if nums[j] < nums[i] and dp[j] + 1 > dp[i] then
        dp[i] = dp[j] + 1
      end
    end
    if dp[i] > best then best = dp[i] end
  end

  return best
end

print(longest_increasing_subsequence({ 10, 9, 2, 5, 3, 7, 101, 18 }))
print(longest_increasing_subsequence({ 0, 1, 0, 3, 2, 3 }))
