local Point = {}
Point.__index = Point

function Point.new(x, y)
  return setmetatable({ x = x, y = y }, Point)
end

Point.__add = function(a, b)
  return Point.new(a.x + b.x, a.y + b.y)
end

Point.__tostring = function(p)
  return "(" .. p.x .. ", " .. p.y .. ")"
end

local p1 = Point.new(1, 2)
local p2 = Point.new(3, 4)
print(tostring(p1 + p2))
