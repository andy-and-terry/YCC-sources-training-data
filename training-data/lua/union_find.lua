local UnionFind = {}
UnionFind.__index = UnionFind

function UnionFind.new(n)
  local self = setmetatable({}, UnionFind)
  self.parent = {}
  for i = 1, n do self.parent[i] = i end
  return self
end

function UnionFind:find(x)
  if self.parent[x] == x then return x end
  return self:find(self.parent[x])
end

function UnionFind:union(x, y)
  local root_x, root_y = self:find(x), self:find(y)
  if root_x ~= root_y then self.parent[root_x] = root_y end
end

local uf = UnionFind.new(5)
uf:union(1, 2)
uf:union(2, 3)
print(uf:find(1) == uf:find(3))
print(uf:find(1) == uf:find(4))
