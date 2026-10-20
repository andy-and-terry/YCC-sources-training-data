local function counter(start)
  local n = start or 0
  return function() n = n + 1; return n end
end
local c = counter(10)
print(c(), c(), c())

local function range(a, b, step)
  step = step or 1
  return function(_, i) i = i + step; if i <= b then return i end end, nil, a - step
end
for i in range(1, 10, 3) do io.write(i, " ") end
print()

local function chars(s) local i = 0; return function() i = i + 1; if i <= #s then return s:sub(i, i) end end end
for ch in chars("abc") do io.write(ch, "-") end
print()
local function map(t, f) local r = {} for i, v in ipairs(t) do r[i] = f(v) end return r end
print(table.concat(map({1, 2, 3}, function(x) return x * x end), ","))
