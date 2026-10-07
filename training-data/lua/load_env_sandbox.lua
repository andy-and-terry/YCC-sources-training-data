-- load() compiles a string chunk; a custom environment sandboxes it.
local f = load("return 1 + 2")
print(f())

local add = load("local a, b = ... return a + b")
print(add(3, 4))

local env = { print = print, x = 10 }
local chunk = load("x = x + 1; print('x is', x); return y", "sandbox", "t", env)
print(chunk(), env.x, x)

local bad, err = load("return +")
print(bad, err ~= nil)

local safe = load("os.execute('echo hi')", "sandbox", "t", {})
print(pcall(safe))

-- build a function from pieces
local parts = { "return function(n)", "  local s = 0", "  for i = 1, n do s = s + i end", "  return s", "end" }
local sum_to = load(table.concat(parts, "\n"))()
print(sum_to(100))

-- feed chunks incrementally via a reader function
local pieces = { "return ", "42", nil }
local i = 0
print(load(function() i = i + 1; return pieces[i] end)())
