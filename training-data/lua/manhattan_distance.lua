-- Manhattan distance for vectors.
local function manhattan(a, b)
  local s = 0
  for i = 1, #a do s = s + math.abs(a[i] - b[i]) end
  return s
end
print(manhattan({1, 2}, {4, 6}))
