type
  AVLNode = ref object
    value: int
    left, right: AVLNode
    height: int

proc height(n: AVLNode): int =
  if n == nil: 0 else: n.height

proc update(n: AVLNode) =
  n.height = 1 + max(height(n.left), height(n.right))

proc balanceFactor(n: AVLNode): int =
  if n == nil: 0 else: height(n.left) - height(n.right)

proc rotateRight(y: AVLNode): AVLNode =
  let x = y.left
  let t2 = x.right
  x.right = y
  y.left = t2
  update(y)
  update(x)
  result = x

proc rotateLeft(x: AVLNode): AVLNode =
  let y = x.right
  let t2 = y.left
  y.left = x
  x.right = t2
  update(x)
  update(y)
  result = y

proc insert(node: AVLNode, value: int): AVLNode =
  if node == nil:
    return AVLNode(value: value, height: 1)
  if value < node.value:
    node.left = insert(node.left, value)
  elif value > node.value:
    node.right = insert(node.right, value)
  else:
    return node
  update(node)
  let balance = balanceFactor(node)
  if balance > 1 and value < node.left.value:
    return rotateRight(node)
  if balance < -1 and value > node.right.value:
    return rotateLeft(node)
  if balance > 1 and value > node.left.value:
    node.left = rotateLeft(node.left)
    return rotateRight(node)
  if balance < -1 and value < node.right.value:
    node.right = rotateRight(node.right)
    return rotateLeft(node)
  result = node

proc inorder(node: AVLNode, acc: var seq[int]) =
  if node != nil:
    inorder(node.left, acc)
    acc.add(node.value)
    inorder(node.right, acc)

var root: AVLNode = nil
for v in [10, 20, 30, 40, 50, 25]:
  root = insert(root, v)
var acc: seq[int] = @[]
inorder(root, acc)
echo acc
echo root.value
