local V = {}
V.__index = V
V.__add = function(a, b) return setmetatable({ x = a.x + b.x }, V) end
V.__tostring = function(v) return "V(" .. v.x .. ")" end
local a, b = setmetatable({ x = 1 }, V), setmetatable({ x = 2 }, V)
print(tostring(a + b))
