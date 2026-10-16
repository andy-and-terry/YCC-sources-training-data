local function filter(t, pred)
  local out = {}
  for _, v in ipairs(t) do
    if pred(v) then out[#out + 1] = v end
  end
  return out
end

local function map(t, f)
  local out = {}
  for i, v in ipairs(t) do out[i] = f(v) end
  return out
end

local function reduce(t, f, acc)
  for _, v in ipairs(t) do acc = f(acc, v) end
  return acc
end

local nums = {}
for i = 1, 10 do nums[i] = i end
local evens = filter(nums, function(x) return x % 2 == 0 end)
local squares = map(evens, function(x) return x * x end)
print(table.concat(squares, " "))
print(reduce(squares, function(a, b) return a + b end, 0))
