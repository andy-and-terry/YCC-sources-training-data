local DoublyLinkedList = {}
DoublyLinkedList.__index = DoublyLinkedList

function DoublyLinkedList.new()
  return setmetatable({ head = nil, tail = nil, size = 0 }, DoublyLinkedList)
end

function DoublyLinkedList:push_back(value)
  local node = { value = value, prev = self.tail, next = nil }
  if self.tail then
    self.tail.next = node
  else
    self.head = node
  end
  self.tail = node
  self.size = self.size + 1
end

function DoublyLinkedList:push_front(value)
  local node = { value = value, prev = nil, next = self.head }
  if self.head then
    self.head.prev = node
  else
    self.tail = node
  end
  self.head = node
  self.size = self.size + 1
end

function DoublyLinkedList:pop_back()
  if not self.tail then return nil end
  local node = self.tail
  self.tail = node.prev
  if self.tail then
    self.tail.next = nil
  else
    self.head = nil
  end
  self.size = self.size - 1
  return node.value
end

function DoublyLinkedList:to_table()
  local out = {}
  local node = self.head
  while node do
    table.insert(out, node.value)
    node = node.next
  end
  return out
end

function DoublyLinkedList:to_table_reverse()
  local out = {}
  local node = self.tail
  while node do
    table.insert(out, node.value)
    node = node.prev
  end
  return out
end

local list = DoublyLinkedList.new()
list:push_back(1)
list:push_back(2)
list:push_back(3)
list:push_front(0)

print(table.concat(list:to_table(), " "))
print(table.concat(list:to_table_reverse(), " "))
print(list:pop_back())
print(table.concat(list:to_table(), " "))
print("size:", list.size)
