local log = {}
local t = setmetatable({}, {
  __index = function(_, k)
    log[#log + 1] = "get " .. tostring(k)
    return 0
  end,
  __newindex = function(tbl, k, v)
    log[#log + 1] = "set " .. tostring(k)
    rawset(tbl, k, v)
  end,
})

print(t.x)
t.x = 5
t.x = 6
print(t.x, rawget(t, "y"))
print(table.concat(log, ", "))

local a, b = {}, {}
print(a == b, rawequal(a, a), rawlen({1, 2, 3}))

local eqmt = { __eq = function() return true end }
local p, q = setmetatable({}, eqmt), setmetatable({}, eqmt)
print(p == q, rawequal(p, q))
