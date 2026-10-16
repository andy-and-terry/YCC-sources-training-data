type
  P = object
    x, y: int
  Node = ref object
    val: int
    next: Node

let a = P(x: 1, y: 2)
var b = a
b.x = 9
echo a == P(x: 1, y: 2), " ", a == b

let n1 = Node(val: 1)
let n2 = n1
n2.val = 42
echo n1.val
let n3 = Node(val: 1)
echo n1 == n3, " ", n1[] == n3[]
