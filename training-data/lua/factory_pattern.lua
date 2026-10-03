local Dog = {}
Dog.__index = Dog
function Dog.new() return setmetatable({ sound = "Woof" }, Dog) end
function Dog:speak() return self.sound end

local Cat = {}
Cat.__index = Cat
function Cat.new() return setmetatable({ sound = "Meow" }, Cat) end
function Cat:speak() return self.sound end

local function animal_factory(kind)
  if kind == "dog" then return Dog.new()
  elseif kind == "cat" then return Cat.new()
  else error("unknown animal kind: " .. kind) end
end

local pets = { animal_factory("dog"), animal_factory("cat") }
for _, pet in ipairs(pets) do print(pet:speak()) end
