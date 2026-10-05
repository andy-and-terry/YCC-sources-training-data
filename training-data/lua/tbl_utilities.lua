local function map(t, f)
  local out = {}
  for i, v in ipairs(t) do out[i] = f(v) end
  return out
end

local function filter(t, pred)
  local out = {}
  for _, v in ipairs(t) do
    if pred(v) then out[#out + 1] = v end
  end
  return out
end

local function reduce(t, f, init)
  local acc = init
  for _, v in ipairs(t) do acc = f(acc, v) end
  return acc
end

local function keys(t)
  local ks = {}
  for k in pairs(t) do ks[#ks + 1] = k end
  table.sort(ks)
  return ks
end

local nums = { 1, 2, 3, 4, 5, 6 }
print(table.concat(map(nums, function(x) return x * x end), ","))
print(table.concat(filter(nums, function(x) return x % 2 == 0 end), ","))
print(reduce(nums, function(a, b) return a + b end, 0))
print(table.concat(keys({ b = 1, a = 2, c = 3 }), ","))
print(table.concat(table.move(nums, 2, 4, 1, {}), ","))
table.insert(nums, 1, 0)
print(table.remove(nums), #nums)
