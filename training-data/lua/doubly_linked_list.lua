local DoublyLinkedList = {}
DoublyLinkedList.__index = DoublyLinkedList

function DoublyLinkedList.new()
  return setmetatable({ head = nil, tail = nil, size = 0 }, DoublyLinkedList)
end

function DoublyLinkedList:pushBack(value)
  local node = { value = value, prev = self.tail, next = nil }
  if self.tail then
    self.tail.next = node
  else
    self.head = node
  end
  self.tail = node
  self.size = self.size + 1
end

function DoublyLinkedList:pushFront(value)
  local node = { value = value, prev = nil, next = self.head }
  if self.head then
    self.head.prev = node
  else
    self.tail = node
  end
  self.head = node
  self.size = self.size + 1
end

function DoublyLinkedList:popFront()
  if not self.head then return nil end
  local node = self.head
  self.head = node.next
  if self.head then
    self.head.prev = nil
  else
    self.tail = nil
  end
  self.size = self.size - 1
  return node.value
end

function DoublyLinkedList:toTable()
  local result = {}
  local node = self.head
  while node do
    table.insert(result, node.value)
    node = node.next
  end
  return result
end

local list = DoublyLinkedList.new()
list:pushBack(2)
list:pushBack(3)
list:pushFront(1)
print(table.concat(list:toTable(), " "))
print(list:popFront())
print(table.concat(list:toTable(), " "))
print(list.size)
