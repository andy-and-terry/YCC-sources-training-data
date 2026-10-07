-- Table-based OOP where each class is itself callable: `Dog(name)`
-- constructs an instance instead of `Dog.new(name)`, via __call, and
-- child classes reach their parent's method with an explicit "super" call.
local function class(parent)
  local cls = {}
  cls.__index = cls
  cls.super = parent
  if parent then
    setmetatable(cls, { __index = parent, __call = function(self, ...)
      return self.new(...)
    end })
  else
    setmetatable(cls, { __call = function(self, ...)
      return self.new(...)
    end })
  end
  return cls
end

local Animal = class()

function Animal.new(name)
  return setmetatable({ name = name }, Animal)
end

function Animal:speak()
  return self.name .. " makes a sound"
end

local Dog = class(Animal)

function Dog.new(name, breed)
  local self = Animal.new(name)
  self.breed = breed
  return setmetatable(self, Dog)
end

function Dog:speak()
  return Animal.speak(self) .. ", specifically a bark (" .. self.breed .. ")"
end

local generic = Animal("Generic")
local rex = Dog("Rex", "Labrador")

print(generic:speak())
print(rex:speak())
print(rex.super == Animal)
