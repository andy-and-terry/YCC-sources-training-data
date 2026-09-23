type
  SNode = ref object
    value: int
    next: SNode

  SinglyLinkedList = object
    head: SNode

proc pushFront(list: var SinglyLinkedList, value: int) =
  list.head = SNode(value: value, next: list.head)

proc reverse(list: var SinglyLinkedList) =
  var prev: SNode = nil
  var curr = list.head
  while curr != nil:
    let nxt = curr.next
    curr.next = prev
    prev = curr
    curr = nxt
  list.head = prev

proc toSeq(list: SinglyLinkedList): seq[int] =
  var node = list.head
  while node != nil:
    result.add(node.value)
    node = node.next

var list: SinglyLinkedList
for v in [3, 2, 1]:
  list.pushFront(v)
echo list.toSeq()
list.reverse()
echo list.toSeq()
