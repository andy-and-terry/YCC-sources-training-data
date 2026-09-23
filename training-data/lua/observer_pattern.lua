local Subject = {}
Subject.__index = Subject

function Subject.new()
  return setmetatable({ observers = {} }, Subject)
end

function Subject:attach(observer)
  table.insert(self.observers, observer)
end

function Subject:notify(value)
  for _, observer in ipairs(self.observers) do
    observer(value)
  end
end

local subject = Subject.new()
subject:attach(function(v) print("observer A saw: " .. v) end)
subject:attach(function(v) print("observer B saw: " .. (v * 2)) end)

subject:notify(10)
subject:notify(21)
