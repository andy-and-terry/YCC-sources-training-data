local Set = {}
Set.__index = Set

function Set.new(list)
  local s = setmetatable({}, Set)
  for _, v in ipairs(list or {}) do
    s[v] = true
  end
  return s
end

function Set.__add(a, b)
  local r = Set.new()
  for k in pairs(a) do r[k] = true end
  for k in pairs(b) do r[k] = true end
  return r
end

function Set.__mul(a, b)
  local r = Set.new()
  for k in pairs(a) do
    if b[k] then r[k] = true end
  end
  return r
end

function Set.__sub(a, b)
  local r = Set.new()
  for k in pairs(a) do
    if not b[k] then r[k] = true end
  end
  return r
end

function Set.__le(a, b)
  for k in pairs(a) do
    if not b[k] then return false end
  end
  return true
end

function Set.__lt(a, b) return a <= b and not (b <= a) end

function Set.__eq(a, b) return a <= b and b <= a end

function Set.__tostring(s)
  local items = {}
  for k in pairs(s) do items[#items + 1] = tostring(k) end
  table.sort(items)
  return "{" .. table.concat(items, ", ") .. "}"
end

local a = Set.new({ 1, 2, 3, 4 })
local b = Set.new({ 3, 4, 5 })
print(a + b, a * b, a - b)
print(Set.new({ 3 }) <= a, Set.new({ 3 }) < a, a < a)
print(a == Set.new({ 4, 3, 2, 1 }), a == b)
