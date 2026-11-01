local function stats(...)
  local n = select("#", ...)
  local sum = 0
  for i = 1, n do sum = sum + select(i, ...) end
  return n, sum / n
end
print(stats(2, 4, 6, 8))
print(table.unpack({ 1, 2, 3 }))
local packed = table.pack(nil, 2, nil)
print(packed.n)
