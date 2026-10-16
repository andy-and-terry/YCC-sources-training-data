local f = load("return 1 + 2")
print(f())

local g, err = load("return +")
print(g, err ~= nil)

local pieces = { "return ", "10 ", "* 4" }
local i = 0
local h = load(function()
  i = i + 1
  return pieces[i]
end)
print(h())

local env = { x = 7 }
print(load("return x * 2", "chunk", "t", env)())
