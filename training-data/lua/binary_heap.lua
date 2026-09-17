local MinHeap = {}
MinHeap.__index = MinHeap

function MinHeap.new()
  return setmetatable({ data = {} }, MinHeap)
end

function MinHeap:push(value)
  local data = self.data
  table.insert(data, value)
  local i = #data
  while i > 1 do
    local parent = i // 2
    if data[parent] > data[i] then
      data[parent], data[i] = data[i], data[parent]
      i = parent
    else
      break
    end
  end
end

function MinHeap:pop()
  local data = self.data
  local top = data[1]
  data[1] = data[#data]
  data[#data] = nil
  local i, n = 1, #data
  while true do
    local left, right, smallest = 2 * i, 2 * i + 1, i
    if left <= n and data[left] < data[smallest] then smallest = left end
    if right <= n and data[right] < data[smallest] then smallest = right end
    if smallest == i then break end
    data[i], data[smallest] = data[smallest], data[i]
    i = smallest
  end
  return top
end

local heap = MinHeap.new()
for _, v in ipairs({ 5, 3, 8, 1, 9, 2 }) do
  heap:push(v)
end

local sorted = {}
for i = 1, 6 do
  sorted[i] = heap:pop()
end
print(table.concat(sorted, ", "))
