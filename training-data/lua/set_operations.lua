-- Sets as tables of element -> true.
local Set = {}
Set.__index = Set

function Set.new(list)
  local s = setmetatable({}, Set)
  for _, v in ipairs(list or {}) do s[v] = true end
  return s
end

function Set.__add(a, b)  -- union
  local r = Set.new()
  for k in pairs(a) do r[k] = true end
  for k in pairs(b) do r[k] = true end
  return r
end

function Set.__mul(a, b)  -- intersection
  local r = Set.new()
  for k in pairs(a) do if b[k] then r[k] = true end end
  return r
end

function Set.__sub(a, b)  -- difference
  local r = Set.new()
  for k in pairs(a) do if not b[k] then r[k] = true end end
  return r
end

function Set.__le(a, b)   -- subset
  for k in pairs(a) do if not b[k] then return false end end
  return true
end

function Set.__tostring(s)
  local items = {}
  for k in pairs(s) do items[#items + 1] = tostring(k) end
  table.sort(items)
  return "{" .. table.concat(items, ", ") .. "}"
end

local a, b = Set.new({ 1, 2, 3 }), Set.new({ 2, 3, 4 })
print(tostring(a + b), tostring(a * b), tostring(a - b))
print(a <= b, Set.new({ 2, 3 }) <= a)
