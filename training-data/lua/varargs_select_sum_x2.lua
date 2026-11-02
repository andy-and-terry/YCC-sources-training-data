local function sum(...)
  local s = 0
  for i = 1, select("#", ...) do s = s + (select(i, ...)) end
  return s
end
print(sum(1, 2, 3, 4))
