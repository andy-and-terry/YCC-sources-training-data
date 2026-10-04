local t = { 5, 2, 8 }
table.insert(t, 1)
table.insert(t, 1, 9)
print(table.concat(t, ","))
print(table.remove(t), table.remove(t, 1))
table.sort(t, function(a, b) return a > b end)
print(table.concat(t, " "))

local moved = table.move({ 1, 2, 3 }, 1, 3, 2, { 0 })
print(table.concat(moved, ","))
print(#t, select("#", table.unpack(t)))

local function map(f, xs)
  local out = {}
  for i, v in ipairs(xs) do out[i] = f(v) end
  return out
end
print(table.concat(map(function(x) return x * x end, { 1, 2, 3 }), " "))

local keys = {}
for k in pairs({ a = 1, b = 2, c = 3 }) do keys[#keys + 1] = k end
table.sort(keys)
print(table.concat(keys))
