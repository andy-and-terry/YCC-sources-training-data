local V = {}
V.__index = V

function V.new(x, y) return setmetatable({x = x, y = y}, V) end
V.__add = function(a, b) return V.new(a.x + b.x, a.y + b.y) end
V.__eq = function(a, b) return a.x == b.x and a.y == b.y end
V.__tostring = function(v) return "(" .. v.x .. ", " .. v.y .. ")" end

local p = V.new(1, 2) + V.new(3, 4)
print(p, p == V.new(4, 6))
