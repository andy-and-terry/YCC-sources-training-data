local function min_coins(coins, amount)
  local dp = {}
  dp[0] = 0
  for n = 1, amount do
    dp[n] = -1
    for _, c in ipairs(coins) do
      if c <= n and dp[n - c] ~= -1 then
        if dp[n] == -1 or dp[n - c] + 1 < dp[n] then
          dp[n] = dp[n - c] + 1
        end
      end
    end
  end
  return dp[amount]
end

print(min_coins({ 1, 2, 5 }, 11))
