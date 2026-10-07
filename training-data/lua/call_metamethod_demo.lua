local Adder = {}
Adder.__index = Adder

Adder.__call = function(self, x)
  self.total = self.total + x
  return self.total
end

function Adder.new(start)
  return setmetatable({ total = start }, Adder)
end

local add5 = Adder.new(5)
print(add5(3))
print(add5(10))

local Money = {}
Money.__index = Money

function Money.new(cents)
  return setmetatable({ cents = cents }, Money)
end

Money.__eq = function(a, b)
  return a.cents == b.cents
end

Money.__lt = function(a, b)
  return a.cents < b.cents
end

Money.__le = function(a, b)
  return a.cents <= b.cents
end

local a = Money.new(100)
local b = Money.new(250)
print(a == Money.new(100))
print(a < b)
print(b <= a)
