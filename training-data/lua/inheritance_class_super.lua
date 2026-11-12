local Animal = {}; Animal.__index = Animal
function Animal.new(n) return setmetatable({ name = n }, Animal) end
function Animal:speak() return self.name .. " makes a sound" end
local Dog = setmetatable({}, { __index = Animal }); Dog.__index = Dog
function Dog.new(n) return setmetatable(Animal.new(n), Dog) end
function Dog:speak() return Animal.speak(self) .. ": woof" end
print(Dog.new("rex"):speak())
