print(7 // 2, 7.0 // 2, -7 // 2)
print(7 % 3, -7 % 3, 7 % -3, 5.5 % 2)
print(7 / 2, 6 / 2, 2 ^ 10)

print(math.type(1), math.type(1.0), math.type("1"))
print(1 == 1.0, math.tointeger(3.0), math.tointeger(3.5))
print(3 | 0, 10 // 3 * 3 + 10 % 3)

print(math.maxinteger, math.mininteger)
print(math.maxinteger + 1 == math.mininteger)
print(math.maxinteger + 1.0)
print(math.ult(1, -1), 1 < -1)

print(math.floor(-3.5), math.ceil(-3.5), math.abs(-4))
print(math.max(3, 9, 2), math.min(3, 9, 2))
print(math.sqrt(16), math.fmod(-7, 3), math.huge, -math.huge)
print(0.1 + 0.2 == 0.3, math.abs(0.1 + 0.2 - 0.3) < 1e-9)

print(tonumber("42"), tonumber("0x1F"), tonumber("  3.5  "), tonumber("abc"))
print(tonumber("ff", 16), tonumber("1010", 2), tonumber("zz", 36))
print(string.format("%d", 3.0))
print(pcall(string.format, "%d", 3.5))
print(10 // 0.0, -10 // 0.0, 0.0 / 0.0 ~= 0.0 / 0.0)
print(pcall(function() return 1 // 0 end))
