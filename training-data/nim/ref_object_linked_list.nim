type Node = ref object
  v: int
  next: Node
var head: Node
for i in 1..3: head = Node(v: i, next: head)
var p = head
while p != nil:
  stdout.write p.v, " "
  p = p.next
echo ""
