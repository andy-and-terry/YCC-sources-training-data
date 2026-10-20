local Animal = {}
Animal.__index = Animal
function Animal.new(name) local self = setmetatable({}, Animal); self.name = name; return self end
function Animal:speak() return self.name .. " makes a sound" end

local Dog = setmetatable({}, { __index = Animal })
Dog.__index = Dog
function Dog.new(name)
  local self = Animal.new(name)
  return setmetatable(self, Dog)
end
function Dog:speak() return Animal.speak(self) .. " (woof)" end
function Dog:fetch() return self.name .. " fetches" end

local d = Dog.new("Rex")
print(d:speak())
print(d:fetch())
print(getmetatable(d) == Dog, rawget(d, "speak"))
