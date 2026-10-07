-- Binary indexed tree (Fenwick tree): point updates and prefix sums in
-- O(log n), using each index's lowest set bit to hop between nodes.
local FenwickTree = {}
FenwickTree.__index = FenwickTree

function FenwickTree.new(size)
  local self = setmetatable({}, FenwickTree)
  self.size = size
  self.tree = {}
  for i = 1, size do self.tree[i] = 0 end
  return self
end

function FenwickTree:add(index, delta)
  while index <= self.size do
    self.tree[index] = self.tree[index] + delta
    index = index + (index & -index)
  end
end

function FenwickTree:prefix_sum(index)
  local total = 0
  while index > 0 do
    total = total + self.tree[index]
    index = index - (index & -index)
  end
  return total
end

function FenwickTree:range_sum(from, to)
  return self:prefix_sum(to) - self:prefix_sum(from - 1)
end

local values = { 3, 2, -1, 6, 5, 4, -3, 3 }
local fenwick = FenwickTree.new(#values)
for i, v in ipairs(values) do
  fenwick:add(i, v)
end

print(fenwick:prefix_sum(4))
print(fenwick:range_sum(3, 6))
fenwick:add(3, 10)
print(fenwick:range_sum(3, 6))
