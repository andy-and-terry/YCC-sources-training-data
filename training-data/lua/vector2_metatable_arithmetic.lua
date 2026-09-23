local Vector2 = {}
Vector2.__index = Vector2

function Vector2.new(x, y)
  return setmetatable({ x = x, y = y }, Vector2)
end

Vector2.__add = function(a, b)
  return Vector2.new(a.x + b.x, a.y + b.y)
end

Vector2.__sub = function(a, b)
  return Vector2.new(a.x - b.x, a.y - b.y)
end

Vector2.__mul = function(a, scalar)
  return Vector2.new(a.x * scalar, a.y * scalar)
end

Vector2.__unm = function(a)
  return Vector2.new(-a.x, -a.y)
end

Vector2.__eq = function(a, b)
  return a.x == b.x and a.y == b.y
end

Vector2.__tostring = function(v)
  return "(" .. v.x .. ", " .. v.y .. ")"
end

function Vector2:length()
  return math.sqrt(self.x * self.x + self.y * self.y)
end

local a = Vector2.new(1, 2)
local b = Vector2.new(3, -1)

print(tostring(a + b))
print(tostring(a - b))
print(tostring(a * 3))
print(tostring(-a))
print(a == Vector2.new(1, 2))
print(string.format("%.3f", (Vector2.new(3, 4)):length()))
