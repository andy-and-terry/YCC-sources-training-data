type
  Node = ref object
    value: int
    next: Node

proc push(head: var Node, v: int) =
  head = Node(value: v, next: head)

proc toSeq(head: Node): seq[int] =
  var cur = head
  while cur != nil:
    result.add cur.value
    cur = cur.next

var list: Node
for i in 1 .. 4:
  list.push i * i

echo toSeq(list)

let alias = list
alias.value = 100
echo "shared mutation: ", list.value
