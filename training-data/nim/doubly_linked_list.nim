type
  DNode = ref object
    value: int
    prev, next: DNode

  DoublyLinkedList = object
    head, tail: DNode

proc pushBack(list: var DoublyLinkedList, value: int) =
  let node = DNode(value: value)
  if list.tail == nil:
    list.head = node
    list.tail = node
  else:
    node.prev = list.tail
    list.tail.next = node
    list.tail = node

proc pushFront(list: var DoublyLinkedList, value: int) =
  let node = DNode(value: value)
  if list.head == nil:
    list.head = node
    list.tail = node
  else:
    node.next = list.head
    list.head.prev = node
    list.head = node

proc toSeq(list: DoublyLinkedList): seq[int] =
  var node = list.head
  while node != nil:
    result.add(node.value)
    node = node.next

var list: DoublyLinkedList
list.pushBack(2)
list.pushBack(3)
list.pushFront(1)
echo list.toSeq()
