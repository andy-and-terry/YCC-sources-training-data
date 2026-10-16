local a, b, c = 1, 2
print(a, b, c)

a, b = b, a
print(a, b)

local function three() return 1, 2, 3 end
local x, y = three()
print(x, y)
local t = { three(), three() }
print(#t)
print((three()))

local p, q, r = 1, 2, 3
p, q, r = r, p, q
print(p, q, r)
