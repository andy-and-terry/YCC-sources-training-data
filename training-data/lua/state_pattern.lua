local TrafficLight = {}
TrafficLight.__index = TrafficLight

local transitions = { red = "green", green = "yellow", yellow = "red" }

function TrafficLight.new()
  return setmetatable({ state = "red" }, TrafficLight)
end

function TrafficLight:next()
  self.state = transitions[self.state]
  return self.state
end

local light = TrafficLight.new()
for _ = 1, 4 do
  print(light:next())
end
