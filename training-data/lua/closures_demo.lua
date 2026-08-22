local function makeCounter()
  local count = 0
  return function()
    count = count + 1
    return count
  end
end

local counter = makeCounter()
print(counter(), counter(), counter())

local function map(fn, list)
  local result = {}
  for i, v in ipairs(list) do
    result[i] = fn(v)
  end
  return result
end

local doubled = map(function(x) return x * 2 end, { 1, 2, 3, 4 })
print(table.concat(doubled, " "))
