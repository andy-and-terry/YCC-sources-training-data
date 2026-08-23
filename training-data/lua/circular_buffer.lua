local CircularBuffer = {}
CircularBuffer.__index = CircularBuffer

function CircularBuffer.new(capacity)
  local self = setmetatable({}, CircularBuffer)
  self.data = {}
  self.capacity = capacity
  self.size = 0
  self.start = 0
  return self
end

function CircularBuffer:push(value)
  local index = (self.start + self.size) % self.capacity
  self.data[index] = value
  if self.size < self.capacity then
    self.size = self.size + 1
  else
    self.start = (self.start + 1) % self.capacity
  end
end

function CircularBuffer:to_table()
  local result = {}
  for i = 0, self.size - 1 do
    table.insert(result, self.data[(self.start + i) % self.capacity])
  end
  return result
end

local buf = CircularBuffer.new(3)
for _, v in ipairs({ 1, 2, 3, 4, 5 }) do buf:push(v) end
print(table.concat(buf:to_table(), " "))
