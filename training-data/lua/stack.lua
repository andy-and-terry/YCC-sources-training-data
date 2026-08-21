local Stack = {}
Stack.__index = Stack

function Stack.new()
  return setmetatable({ items = {} }, Stack)
end

function Stack:push(item)
  table.insert(self.items, item)
end

function Stack:pop()
  return table.remove(self.items)
end

function Stack:peek()
  return self.items[#self.items]
end

function Stack:isEmpty()
  return #self.items == 0
end

local s = Stack.new()
s:push(1)
s:push(2)
s:push(3)
print(s:pop(), s:peek(), s:isEmpty())
