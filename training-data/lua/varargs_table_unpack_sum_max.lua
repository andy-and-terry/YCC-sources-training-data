local function stats(...)
  local t = {...}
  local sum, max = 0, -math.huge
  for _, v in ipairs(t) do sum = sum + v; if v > max then max = v end end
  return sum, max, select("#", ...)
end
print(stats(3, 9, 4))
print(table.unpack({1, 2, 3}, 2))
