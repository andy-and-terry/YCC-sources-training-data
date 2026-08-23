local Animal = {}
Animal.__index = Animal

function Animal.new(name)
  return setmetatable({ name = name }, Animal)
end

function Animal:speak()
  return self.name .. " makes a sound"
end

local Dog = setmetatable({}, { __index = Animal })
Dog.__index = Dog

function Dog.new(name)
  return setmetatable({ name = name }, Dog)
end

function Dog:speak()
  return self.name .. " barks"
end

local animals = { Animal.new("Generic"), Dog.new("Rex") }
for _, a in ipairs(animals) do print(a:speak()) end
