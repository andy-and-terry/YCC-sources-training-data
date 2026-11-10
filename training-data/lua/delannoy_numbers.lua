local function central_delannoy(n)
  local g = {}
  for i = 0, n do
    g[i] = {}
    for j = 0, n do
      if i == 0 or j == 0 then g[i][j] = 1
      else g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1] end
    end
  end
  return g[n][n]
end

local out = {}
for n = 0, 5 do out[#out + 1] = central_delannoy(n) end
print(table.concat(out, " ")) -- 1 3 13 63 321 1683
