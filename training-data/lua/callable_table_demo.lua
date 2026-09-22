local Multiplier = {}
Multiplier.__index = Multiplier

Multiplier.__call = function(self, x)
  return x * self.factor
end

function Multiplier.new(factor)
  return setmetatable({ factor = factor }, Multiplier)
end

local double = Multiplier.new(2)
local triple = Multiplier.new(3)

print(double(5))
print(triple(5))
print(double(triple(4)))
