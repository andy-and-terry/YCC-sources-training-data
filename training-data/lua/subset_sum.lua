local function subset_sum(nums, target)
  local dp = {}
  for s = 0, target do dp[s] = false end
  dp[0] = true

  for _, num in ipairs(nums) do
    for s = target, num, -1 do
      if dp[s - num] then
        dp[s] = true
      end
    end
  end

  return dp[target]
end

print(subset_sum({ 3, 34, 4, 12, 5, 2 }, 9))   -- true (4 + 5)
print(subset_sum({ 3, 34, 4, 12, 5, 2 }, 30))  -- false
print(subset_sum({ 1, 2, 3, 7 }, 6))           -- true (1 + 2 + 3)
