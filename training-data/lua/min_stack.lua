local MinStack = {}
MinStack.__index = MinStack

function MinStack.new()
  return setmetatable({ data = {}, mins = {} }, MinStack)
end

function MinStack:push(value)
  table.insert(self.data, value)
  local current_min = self.mins[#self.mins]
  if current_min == nil or value < current_min then
    table.insert(self.mins, value)
  else
    table.insert(self.mins, current_min)
  end
end

function MinStack:pop()
  table.remove(self.mins)
  return table.remove(self.data)
end

function MinStack:top()
  return self.data[#self.data]
end

function MinStack:get_min()
  return self.mins[#self.mins]
end

local stack = MinStack.new()
stack:push(5)
stack:push(2)
stack:push(8)
print("min:", stack:get_min())
stack:pop()
print("min after pop:", stack:get_min())
print("top:", stack:top())
