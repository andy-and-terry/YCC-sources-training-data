local Money = {}
Money.__index = Money
local function M(c) return setmetatable({ cents = c }, Money) end

Money.__unm = function(a) return M(-a.cents) end
Money.__mod = function(a, n) return M(a.cents % n) end
Money.__idiv = function(a, n) return M(a.cents // n) end
Money.__tostring = function(a) return string.format("$%d.%02d", a.cents // 100, a.cents % 100) end

print(tostring(M(1999)))
print(tostring(-M(500)))
print(tostring(M(1050) // 3))
print(tostring(M(1050) % 100))
