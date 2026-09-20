local DoublyLinkedList = {}
DoublyLinkedList.__index = DoublyLinkedList

function DoublyLinkedList.new()
  return setmetatable({ head = nil, tail = nil, count = 0 }, DoublyLinkedList)
end

function DoublyLinkedList:push_back(value)
  local node = { value = value, prev = self.tail, next = nil }
  if self.tail then
    self.tail.next = node
  else
    self.head = node
  end
  self.tail = node
  self.count = self.count + 1
end

function DoublyLinkedList:push_front(value)
  local node = { value = value, prev = nil, next = self.head }
  if self.head then
    self.head.prev = node
  else
    self.tail = node
  end
  self.head = node
  self.count = self.count + 1
end

function DoublyLinkedList:remove(node)
  if node.prev then node.prev.next = node.next else self.head = node.next end
  if node.next then node.next.prev = node.prev else self.tail = node.prev end
  self.count = self.count - 1
end

function DoublyLinkedList:to_table()
  local result = {}
  local node = self.head
  while node do
    table.insert(result, node.value)
    node = node.next
  end
  return result
end

function DoublyLinkedList:to_table_reverse()
  local result = {}
  local node = self.tail
  while node do
    table.insert(result, node.value)
    node = node.prev
  end
  return result
end

local list = DoublyLinkedList.new()
list:push_back(1)
list:push_back(2)
list:push_back(3)
list:push_front(0)

print(table.concat(list:to_table(), ","))
print(table.concat(list:to_table_reverse(), ","))

list:remove(list.head.next)
print(table.concat(list:to_table(), ","))
