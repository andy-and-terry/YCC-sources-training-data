local Config = {}
Config.__index = Config

local instance = nil

function Config.get_instance()
  if instance == nil then
    instance = setmetatable({ loaded = true, value = "default" }, Config)
    print("creating the one and only Config instance")
  end
  return instance
end

local c1 = Config.get_instance()
local c2 = Config.get_instance()
c1.value = "changed"
print("c1 == c2:", c1 == c2)
print("c2.value:", c2.value)
