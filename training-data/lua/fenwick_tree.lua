local FenwickTree = {}
FenwickTree.__index = FenwickTree

function FenwickTree.new(size)
  return setmetatable({ size = size, tree = {} }, FenwickTree)
end

function FenwickTree:update(i, delta)
  i = i + 1
  while i <= self.size do
    self.tree[i] = (self.tree[i] or 0) + delta
    i = i + (i & -i)
  end
end

function FenwickTree:prefix_sum(i)
  i = i + 1
  local sum = 0
  while i > 0 do
    sum = sum + (self.tree[i] or 0)
    i = i - (i & -i)
  end
  return sum
end

function FenwickTree:range_sum(l, r)
  if l == 0 then return self:prefix_sum(r) end
  return self:prefix_sum(r) - self:prefix_sum(l - 1)
end

local values = { 3, 2, -1, 6, 5, 4, -3, 3, 7, 2 }
local ft = FenwickTree.new(#values)
for i, v in ipairs(values) do
  ft:update(i - 1, v)
end

print(ft:prefix_sum(4))
print(ft:range_sum(2, 6))
