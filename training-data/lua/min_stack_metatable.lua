local MinStack = {}
MinStack.__index = MinStack

function MinStack.new() return setmetatable({ items = {} }, MinStack) end

function MinStack:push(x)
  local top = self.items[#self.items]
  table.insert(self.items, { x, top and math.min(x, top[2]) or x })
end

function MinStack:pop() return table.remove(self.items)[1] end
function MinStack:min() return self.items[#self.items][2] end

local s = MinStack.new()
for _, v in ipairs({ 5, 3, 7, 2 }) do s:push(v) end
print(s:min())
s:pop()
print(s:min())
