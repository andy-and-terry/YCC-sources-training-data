local function stats(...)
  local n = select("#", ...)
  local t = table.pack(...)
  local sum = 0
  for i = 1, t.n do sum = sum + t[i] end
  return n, sum / n
end

print(stats(2, 4, 9))
