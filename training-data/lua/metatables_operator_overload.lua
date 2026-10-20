local Vec = {}
Vec.__index = Vec
function Vec.new(x, y) return setmetatable({ x = x, y = y }, Vec) end
Vec.__add = function(a, b) return Vec.new(a.x + b.x, a.y + b.y) end
Vec.__sub = function(a, b) return Vec.new(a.x - b.x, a.y - b.y) end
Vec.__mul = function(a, k) return Vec.new(a.x * k, a.y * k) end
Vec.__eq = function(a, b) return a.x == b.x and a.y == b.y end
Vec.__lt = function(a, b) return a.x < b.x end
Vec.__tostring = function(v) return "(" .. v.x .. ", " .. v.y .. ")" end
Vec.__len = function(v) return 2 end
Vec.__call = function(v, k) return v * k end
Vec.__unm = function(v) return Vec.new(-v.x, -v.y) end

local a, b = Vec.new(1, 2), Vec.new(3, 4)
print(a + b, b - a, a * 3, -a, a == Vec.new(1, 2), a < b, #a, a(10))
