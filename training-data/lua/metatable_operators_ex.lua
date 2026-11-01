local V = {}
V.__index = V
V.__add = function(a, b) return setmetatable({ x = a.x + b.x, y = a.y + b.y }, V) end
V.__tostring = function(v) return "(" .. v.x .. "," .. v.y .. ")" end
V.__eq = function(a, b) return a.x == b.x and a.y == b.y end
local function new(x, y) return setmetatable({ x = x, y = y }, V) end
print(new(1, 2) + new(3, 4))
print(new(1, 1) == new(1, 1))
