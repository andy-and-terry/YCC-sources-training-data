local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList.new()
  return setmetatable({ head = nil, size = 0 }, LinkedList)
end

function LinkedList:push_front(value)
  self.head = { value = value, next = self.head }
  self.size = self.size + 1
end

function LinkedList:to_table()
  local out = {}
  local node = self.head
  while node do
    table.insert(out, node.value)
    node = node.next
  end
  return out
end

function LinkedList:reverse()
  local prev = nil
  local node = self.head
  while node do
    local next_node = node.next
    node.next = prev
    prev = node
    node = next_node
  end
  self.head = prev
end

local list = LinkedList.new()
for _, v in ipairs({ 1, 2, 3, 4 }) do
  list:push_front(v)
end

print(table.concat(list:to_table(), ", "))
list:reverse()
print(table.concat(list:to_table(), ", "))
print("size:", list.size)
