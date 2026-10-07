local Queue = {}
Queue.__index = Queue

function Queue.new()
  return setmetatable({ first = 1, last = 0, items = {} }, Queue)
end

function Queue:push(value)
  self.last = self.last + 1
  self.items[self.last] = value
end

function Queue:pop()
  if self.first > self.last then
    return nil, "queue is empty"
  end
  local value = self.items[self.first]
  self.items[self.first] = nil
  self.first = self.first + 1
  return value
end

function Queue:size()
  return self.last - self.first + 1
end

function Queue:peek()
  return self.items[self.first]
end

local q = Queue.new()
for i = 1, 5 do q:push(i * 10) end
print(q:size(), q:peek())
print(q:pop(), q:pop())
q:push(99)
print(q:size())

local order = {}
while q:size() > 0 do order[#order + 1] = q:pop() end
print(table.concat(order, " "))
print(q:pop())
