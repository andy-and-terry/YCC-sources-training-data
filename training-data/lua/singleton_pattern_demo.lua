local Config = {}
Config.__index = Config

local instance = nil

function Config.get_instance()
  if not instance then
    instance = setmetatable({ settings = {} }, Config)
  end
  return instance
end

function Config:set(key, value)
  self.settings[key] = value
end

function Config:get(key)
  return self.settings[key]
end

local first = Config.get_instance()
first:set("theme", "dark")

local second = Config.get_instance()
print(second:get("theme"))
print(first == second)
