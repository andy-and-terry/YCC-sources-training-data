local function minimum_total(t)
  local dp = { table.unpack(t[#t]) }
  for r = #t - 1, 1, -1 do
    for i = 1, #t[r] do
      dp[i] = t[r][i] + math.min(dp[i], dp[i + 1])
    end
  end
  return dp[1]
end

print(minimum_total({ { 2 }, { 3, 4 }, { 6, 5, 7 }, { 4, 1, 8, 3 } })) -- 11
