local Animal = {}
Animal.__index = Animal

function Animal.new(name)
  return setmetatable({ name = name }, Animal)
end
function Animal:speak() return self.name .. " makes a sound" end

local Dog = setmetatable({}, { __index = Animal })
Dog.__index = Dog

function Dog.new(name)
  local self = Animal.new(name)
  return setmetatable(self, Dog)
end
function Dog:speak()
  return Animal.speak(self) .. ": woof"
end

print(Animal.new("Generic"):speak())
print(Dog.new("Rex"):speak())
