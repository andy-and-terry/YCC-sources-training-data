-- Returns g, x, y such that a*x + b*y = g = gcd(a, b).
local function extended_gcd(a, b)
  if b == 0 then return a, 1, 0 end
  local g, x1, y1 = extended_gcd(b, a % b)
  return g, y1, x1 - math.floor(a / b) * y1
end

local a, b = 35, 15
local g, x, y = extended_gcd(a, b)
print(string.format("gcd(%d, %d) = %d", a, b, g))
print(string.format("%d*%d + %d*%d = %d", a, x, b, y, a * x + b * y))
