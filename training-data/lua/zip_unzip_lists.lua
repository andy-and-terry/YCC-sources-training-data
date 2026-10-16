local function zip(a, b)
  local out = {}
  for i = 1, math.min(#a, #b) do
    out[i] = { a[i], b[i] }
  end
  return out
end

local function unzip(pairs_)
  local a, b = {}, {}
  for i, p in ipairs(pairs_) do
    a[i], b[i] = p[1], p[2]
  end
  return a, b
end

local z = zip({ "x", "y", "z" }, { 1, 2, 3, 4 })
for _, p in ipairs(z) do print(p[1], p[2]) end
local names, nums = unzip(z)
print(table.concat(names), table.concat(nums))
