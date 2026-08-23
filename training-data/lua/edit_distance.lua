local function edit_distance(a, b)
  local m, n = #a, #b
  local table_dp = {}
  for i = 0, m do
    table_dp[i] = {}
    table_dp[i][0] = i
  end
  for j = 0, n do table_dp[0][j] = j end
  for i = 1, m do
    for j = 1, n do
      local cost = a:sub(i, i) == b:sub(j, j) and 0 or 1
      table_dp[i][j] = math.min(
        table_dp[i - 1][j] + 1,
        table_dp[i][j - 1] + 1,
        table_dp[i - 1][j - 1] + cost
      )
    end
  end
  return table_dp[m][n]
end

print(edit_distance("kitten", "sitting"))
