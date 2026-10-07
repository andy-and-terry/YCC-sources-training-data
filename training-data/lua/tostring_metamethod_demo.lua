local Money = {}
Money.__index = Money

function Money.new(cents) return setmetatable({ cents = cents }, Money) end

Money.__tostring = function(m) return string.format("$%d.%02d", m.cents // 100, m.cents % 100) end
Money.__add = function(a, b) return Money.new(a.cents + b.cents) end
Money.__eq = function(a, b) return a.cents == b.cents end
Money.__lt = function(a, b) return a.cents < b.cents end
Money.__le = function(a, b) return a.cents <= b.cents end
Money.__len = function(m) return m.cents end
Money.__concat = function(a, b) return tostring(a) .. tostring(b) end

local a, b = Money.new(150), Money.new(275)
print(a, b, a + b)
print(a == Money.new(150), a < b, a >= b)
print(#a, a .. " + " .. b)
