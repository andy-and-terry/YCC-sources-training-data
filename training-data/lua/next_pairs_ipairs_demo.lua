local mixed = { "a", "b", "c", x = 1, y = 2 }

for i, v in ipairs(mixed) do io.write(i, "=", v, " ") end
print()

local keys = {}
for k in pairs(mixed) do keys[#keys + 1] = tostring(k) end
table.sort(keys)
print(table.concat(keys, ","))

-- ipairs stops at the first nil
local holes = { 1, 2, nil, 4 }
local n = 0
for _ in ipairs(holes) do n = n + 1 end
print(n)

-- next as a manual iterator
local k, v = next({ only = "one" })
print(k, v)
print(next({}))

-- removing fields while traversing is allowed (assign nil)
local scores = { a = 1, b = 2, c = 3 }
for key, val in pairs(scores) do
  if val % 2 == 1 then scores[key] = nil end
end
print(scores.a, scores.b, scores.c)

-- stateless iterator
local function evens(limit, i)
  i = i + 2
  if i <= limit then return i end
end
for e in evens, 10, 0 do io.write(e, " ") end
print()

-- sorted-key iteration
local function sorted_pairs(t)
  local ks = {}
  for key in pairs(t) do ks[#ks + 1] = key end
  table.sort(ks)
  local i = 0
  return function()
    i = i + 1
    return ks[i], t[ks[i]]
  end
end
for key, val in sorted_pairs({ z = 26, a = 1, m = 13 }) do io.write(key, ":", val, " ") end
print()
