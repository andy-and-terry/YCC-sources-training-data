local Set = {}
Set.__index = Set

function Set.new(list)
  local s = setmetatable({}, Set)
  for _, v in ipairs(list or {}) do s[v] = true end
  return s
end

function Set.union(a, b)
  local r = Set.new()
  for k in pairs(a) do r[k] = true end
  for k in pairs(b) do r[k] = true end
  return r
end

function Set.intersection(a, b)
  local r = Set.new()
  for k in pairs(a) do
    if b[k] then r[k] = true end
  end
  return r
end

function Set.difference(a, b)
  local r = Set.new()
  for k in pairs(a) do
    if not b[k] then r[k] = true end
  end
  return r
end

function Set:toList()
  local list = {}
  for k in pairs(self) do list[#list + 1] = k end
  table.sort(list)
  return list
end

Set.__add = Set.union
Set.__mul = Set.intersection
Set.__sub = Set.difference
Set.__tostring = function(s) return "{" .. table.concat(s:toList(), ", ") .. "}" end

local a = Set.new({ 1, 2, 3, 4 })
local b = Set.new({ 3, 4, 5 })
print(a + b)
print(a * b)
print(a - b)
print(b - a)
