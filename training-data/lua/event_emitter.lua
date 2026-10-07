local Emitter = {}
Emitter.__index = Emitter

function Emitter.new()
  return setmetatable({ handlers = {} }, Emitter)
end

function Emitter:on(event, fn)
  local list = self.handlers[event] or {}
  self.handlers[event] = list
  list[#list + 1] = fn
  return function()
    for i, h in ipairs(list) do
      if h == fn then
        table.remove(list, i)
        return
      end
    end
  end
end

function Emitter:emit(event, ...)
  for _, fn in ipairs(self.handlers[event] or {}) do
    fn(...)
  end
end

local bus = Emitter.new()
local off = bus:on("greet", function(name) print("hello " .. name) end)
bus:on("greet", function(name) print("welcome " .. name) end)
bus:emit("greet", "Ada")
off()
bus:emit("greet", "Bob")
