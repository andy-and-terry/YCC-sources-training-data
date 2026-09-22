local function rod_cutting(prices, n)
  local dp = {}
  dp[0] = 0
  for length = 1, n do
    local best = -1
    for cut = 1, length do
      best = math.max(best, prices[cut] + dp[length - cut])
    end
    dp[length] = best
  end
  return dp[n]
end

local prices = { 1, 5, 8, 9, 10, 17, 17, 20 }
print(rod_cutting(prices, 8))
print(rod_cutting(prices, 4))
