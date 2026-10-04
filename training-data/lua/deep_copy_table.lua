local function deepcopy(orig, seen)
  if type(orig) ~= "table" then
    return orig
  end
  seen = seen or {}
  if seen[orig] then
    return seen[orig]
  end
  local copy = {}
  seen[orig] = copy
  for k, v in pairs(orig) do
    copy[deepcopy(k, seen)] = deepcopy(v, seen)
  end
  return setmetatable(copy, getmetatable(orig))
end

local function shallowcopy(t)
  local c = {}
  for k, v in pairs(t) do
    c[k] = v
  end
  return c
end

local original = { name = "root", list = { 1, 2, 3 }, nested = { deep = { value = 42 } } }
original.self = original

local shallow = shallowcopy(original)
local deep = deepcopy(original)

original.list[1] = 99
original.nested.deep.value = 0

print(shallow.list[1], shallow.nested.deep.value)
print(deep.list[1], deep.nested.deep.value)
print(deep.self == deep, deep.self == original)
print(deep ~= original, deep.list ~= original.list)

local mt = { __tostring = function() return "custom" end }
local obj = setmetatable({ x = 1 }, mt)
print(tostring(deepcopy(obj)))
