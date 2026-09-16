local SegmentTree = {}
SegmentTree.__index = SegmentTree

function SegmentTree.new(data)
  local self = setmetatable({}, SegmentTree)
  self.n = #data
  self.tree = {}
  for i = 1, 2 * self.n do
    self.tree[i] = 0
  end
  for i = 1, self.n do
    self.tree[self.n + i - 1] = data[i]
  end
  for i = self.n - 1, 1, -1 do
    self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]
  end
  return self
end

function SegmentTree:update(index, value)
  local i = index + self.n - 1
  self.tree[i] = value
  while i > 1 do
    i = i // 2
    self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]
  end
end

function SegmentTree:query(left, right)
  local l = left + self.n - 1
  local r = right + self.n - 1
  local total = 0
  while l <= r do
    if l % 2 == 1 then
      total = total + self.tree[l]
      l = l + 1
    end
    if r % 2 == 0 then
      total = total + self.tree[r]
      r = r - 1
    end
    l = l // 2
    r = r // 2
  end
  return total
end

local tree = SegmentTree.new({ 1, 3, 5, 7, 9, 11 })
print(tree:query(1, 4))
tree:update(2, 10)
print(tree:query(1, 4))
