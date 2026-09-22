local function create_class(...)
  local parents = { ... }
  local class = {}

  setmetatable(class, {
    __index = function(_, key)
      for _, parent in ipairs(parents) do
        local value = parent[key]
        if value ~= nil then
          return value
        end
      end
      return nil
    end,
  })
  class.__index = class

  function class.new(o)
    return setmetatable(o or {}, class)
  end

  return class
end

local Swimmer = { swim = function(self) return self.name .. " swims" end }
local Walker = { walk = function(self) return self.name .. " walks" end }

local Duck = create_class(Swimmer, Walker)

function Duck:quack()
  return self.name .. " quacks"
end

local donald = Duck.new({ name = "Donald" })
print(donald:swim())
print(donald:walk())
print(donald:quack())
