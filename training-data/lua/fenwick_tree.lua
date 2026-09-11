local FenwickTree = {}
FenwickTree.__index = FenwickTree

function FenwickTree.new(n)
  local self = setmetatable({ tree = {}, n = n }, FenwickTree)
  for i = 1, n do
    self.tree[i] = 0
  end
  return self
end

function FenwickTree:update(i, delta)
  i = i + 1
  while i <= self.n do
    self.tree[i] = self.tree[i] + delta
    i = i + (i & -i)
  end
end

function FenwickTree:prefixSum(i)
  i = i + 1
  local total = 0
  while i > 0 do
    total = total + self.tree[i]
    i = i - (i & -i)
  end
  return total
end

function FenwickTree:rangeSum(l, r)
  local left = l == 0 and 0 or self:prefixSum(l - 1)
  return self:prefixSum(r) - left
end

local ft = FenwickTree.new(8)
local values = { 3, 2, -1, 6, 5, 4, -3, 3 }
for i, v in ipairs(values) do
  ft:update(i - 1, v)
end

print(ft:prefixSum(4))
print(ft:rangeSum(2, 5))
