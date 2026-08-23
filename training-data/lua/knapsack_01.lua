local function knapsack(weights, values, capacity)
  local dp = {}
  for i = 0, capacity do dp[i] = 0 end
  for i = 1, #weights do
    for cap = capacity, weights[i], -1 do
      dp[cap] = math.max(dp[cap], dp[cap - weights[i]] + values[i])
    end
  end
  return dp[capacity]
end

print(knapsack({ 2, 3, 4, 5 }, { 3, 4, 5, 6 }, 5))
