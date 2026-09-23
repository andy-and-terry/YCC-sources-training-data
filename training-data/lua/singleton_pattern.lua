local Logger = {}
Logger.__index = Logger

local instance = nil

function Logger.get_instance()
  if instance == nil then
    instance = setmetatable({ messages = {} }, Logger)
  end
  return instance
end

function Logger:log(message)
  table.insert(self.messages, message)
  print("[log] " .. message)
end

local a = Logger.get_instance()
local b = Logger.get_instance()

a:log("first message")
b:log("second message")

print("same instance:", a == b)
print("messages seen by b:", #b.messages)
