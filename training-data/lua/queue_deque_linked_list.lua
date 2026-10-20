local Deque = {}
Deque.__index = Deque
function Deque.new() return setmetatable({ first = 0, last = -1, items = {} }, Deque) end
function Deque:pushRight(v) self.last = self.last + 1; self.items[self.last] = v end
function Deque:pushLeft(v) self.first = self.first - 1; self.items[self.first] = v end
function Deque:popLeft() if self.first > self.last then return nil end local v = self.items[self.first]; self.items[self.first] = nil; self.first = self.first + 1; return v end
function Deque:popRight() if self.first > self.last then return nil end local v = self.items[self.last]; self.items[self.last] = nil; self.last = self.last - 1; return v end
function Deque:size() return self.last - self.first + 1 end
local d = Deque.new()
d:pushRight(1); d:pushRight(2); d:pushLeft(0)
print(d:popLeft(), d:popRight(), d:size())
local list
for i = 1, 3 do list = { value = i, next = list } end
local node = list
while node do io.write(node.value, " "); node = node.next end
print()
