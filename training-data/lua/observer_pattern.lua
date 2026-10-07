local Subject = {}
Subject.__index = Subject

function Subject.new()
  return setmetatable({ observers = {} }, Subject)
end

function Subject:subscribe(fn)
  table.insert(self.observers, fn)
end

function Subject:notify(value)
  for _, observer in ipairs(self.observers) do
    observer(value)
  end
end

local sensor = Subject.new()
sensor:subscribe(function(t) print("logger saw: " .. t) end)
sensor:subscribe(function(t) print("doubled: " .. (t * 2)) end)
sensor:notify(10)
sensor:notify(21)
