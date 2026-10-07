-- Strategies are just plain functions passed around; Lua doesn't need an
-- interface hierarchy to swap behavior at runtime.
local function ascending(items)
  local copy = { table.unpack(items) }
  table.sort(copy)
  return copy
end

local function descending(items)
  local copy = { table.unpack(items) }
  table.sort(copy, function(a, b) return a > b end)
  return copy
end

local function sort_with(strategy, items)
  return strategy(items)
end

local nums = { 5, 2, 8, 1, 9 }
print(table.concat(sort_with(ascending, nums), ", "))
print(table.concat(sort_with(descending, nums), ", "))
