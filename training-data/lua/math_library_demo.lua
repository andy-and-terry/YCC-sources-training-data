print(math.floor(-2.5), math.ceil(-2.5), math.abs(-7))
print(math.max(3, 9, 4), math.min(3, 9, 4))
print(math.sqrt(144), 2 ^ 10, 10 // 3, 10 % 3, -10 // 3, -10 % 3)
print(7 / 2, 7 // 2, 7.0 // 2)
print(math.type(1), math.type(1.0), math.type("1"))
print(math.tointeger(3.0), math.tointeger(3.5))
print(math.fmod(-7, 3), -7 % 3)
print(math.huge, -math.huge, math.pi)
print(math.maxinteger, math.mininteger)
print(math.maxinteger + 1 == math.mininteger)
print(math.ult(1, -1), 1 < -1)

local nan = 0 / 0
print(nan == nan, nan ~= nan)

print(string.format("%.4f %.4f %.4f", math.sin(math.pi / 6), math.cos(0), math.atan(1, 1)))
print(math.exp(0), math.log(8, 2), math.log(100, 10))

math.randomseed(42)
local r = math.random(1, 6)
print(r >= 1 and r <= 6)
local f = math.random()
print(f >= 0 and f < 1)

local function round(x, places)
  local m = 10 ^ (places or 0)
  return math.floor(x * m + 0.5) / m
end
print(round(3.14159, 2), round(2.5))
