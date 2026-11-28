local function four_sum_count(a, b, c, d)
  local sums = {}
  for _, x in ipairs(a) do
    for _, y in ipairs(b) do sums[x + y] = (sums[x + y] or 0) + 1 end
  end
  local count = 0
  for _, x in ipairs(c) do
    for _, y in ipairs(d) do count = count + (sums[-(x + y)] or 0) end
  end
  return count
end

print(four_sum_count({1, 2}, {-2, -1}, {-1, 2}, {0, 2})) -- 2
