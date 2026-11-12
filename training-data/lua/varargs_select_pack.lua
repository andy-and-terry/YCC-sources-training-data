local function stats(...)
  local t = table.pack(...)
  local s = 0
  for i = 1, t.n do s = s + t[i] end
  return s, s / t.n, select("#", ...)
end
print(stats(2, 4, 6))
