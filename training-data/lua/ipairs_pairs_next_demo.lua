local mixed = { 10, 20, nil, 40, name = "x", [100] = "far" }

print("ipairs stops at the first nil:")
for i, v in ipairs(mixed) do
  print(i, v)
end

print("pairs visits everything (order of hash part unspecified):")
local keys = {}
for k in pairs(mixed) do
  keys[#keys + 1] = tostring(k)
end
table.sort(keys)
print(table.concat(keys, " "))

print(next({}), next({ 5 }))
print(type(next), next({ a = 1 }))

-- Safe removal while traversing: assigning nil to existing fields is allowed.
local scores = { a = 1, b = 5, c = 2, d = 9 }
for k, v in pairs(scores) do
  if v < 3 then
    scores[k] = nil
  end
end
local remaining = {}
for k in pairs(scores) do remaining[#remaining + 1] = k end
table.sort(remaining)
print(table.concat(remaining, ","))

-- Custom iterator via closure
local function evens(limit)
  local n = 0
  return function()
    n = n + 2
    if n <= limit then return n end
  end
end
for e in evens(8) do io.write(e, " ") end
print()

local function empty(t) return next(t) == nil end
print(empty({}), empty({ false }))

-- __pairs metamethod (Lua 5.2+)
local proxy = setmetatable({}, { __pairs = function() return ipairs({ "x", "y" }) end })
for i, v in pairs(proxy) do io.write(i, "=", v, " ") end
print()
