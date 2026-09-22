local Fraction = {}
Fraction.__index = Fraction

function Fraction.new(num, den)
  return setmetatable({ num = num, den = den }, Fraction)
end

local function value(f)
  return f.num / f.den
end

Fraction.__eq = function(a, b)
  return value(a) == value(b)
end

Fraction.__lt = function(a, b)
  return value(a) < value(b)
end

Fraction.__le = function(a, b)
  return value(a) <= value(b)
end

Fraction.__tostring = function(f)
  return f.num .. "/" .. f.den
end

local half = Fraction.new(1, 2)
local twoQuarters = Fraction.new(2, 4)
local third = Fraction.new(1, 3)

print(half == twoQuarters)
print(third < half)
print(half <= twoQuarters)

local fractions = { half, third, Fraction.new(3, 4) }
table.sort(fractions, function(a, b) return a < b end)
for _, f in ipairs(fractions) do
  io.write(tostring(f), " ")
end
io.write("\n")
