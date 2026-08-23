local Queue = {}
Queue.__index = Queue

function Queue.new()
  return setmetatable({ items = {}, first = 1, last = 0 }, Queue)
end

function Queue:enqueue(item)
  self.last = self.last + 1
  self.items[self.last] = item
end

function Queue:dequeue()
  if self.first > self.last then return nil end
  local item = self.items[self.first]
  self.items[self.first] = nil
  self.first = self.first + 1
  return item
end

local q = Queue.new()
q:enqueue(1)
q:enqueue(2)
q:enqueue(3)
print(q:dequeue())
print(q:dequeue())
