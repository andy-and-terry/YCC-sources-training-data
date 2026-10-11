local grid = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }
local found
for r, row in ipairs(grid) do
  for c, v in ipairs(row) do
    if v == 6 then
      found = { r, c }
      break
    end
  end
  if found then break end
end
print(found[1], found[2])

-- return can exit nested loops directly from a function
local function find(target)
  for r, row in ipairs(grid) do
    for c, v in ipairs(row) do
      if v == target then return r, c end
    end
  end
end
print(find(8))
