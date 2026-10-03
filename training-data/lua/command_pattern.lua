local Light = {}
Light.__index = Light

function Light.new()
  return setmetatable({ on = false }, Light)
end

function Light:turn_on() self.on = true; print("light on") end
function Light:turn_off() self.on = false; print("light off") end

local function make_on_command(light)
  return function() light:turn_on() end
end

local function make_off_command(light)
  return function() light:turn_off() end
end

local light = Light.new()
local commands = { make_on_command(light), make_off_command(light) }
local history = {}

for _, cmd in ipairs(commands) do
  cmd()
  table.insert(history, cmd)
end
print("commands executed:", #history)
