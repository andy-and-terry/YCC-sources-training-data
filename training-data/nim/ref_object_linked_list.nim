type
  Node = ref object
    val: int
    next: Node

var head: Node
for i in countdown(3, 1):
  head = Node(val: i, next: head)

var cur = head
while cur != nil:
  echo cur.val
  cur = cur.next
