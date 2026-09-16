type
  AvlNode = ref object
    value: int
    height: int
    left, right: AvlNode

proc height(node: AvlNode): int =
  if node == nil: 0 else: node.height

proc update(node: AvlNode) =
  node.height = 1 + max(height(node.left), height(node.right))

proc balanceFactor(node: AvlNode): int =
  if node == nil: 0 else: height(node.left) - height(node.right)

proc rotateRight(y: AvlNode): AvlNode =
  let x = y.left
  let t2 = x.right
  x.right = y
  y.left = t2
  update(y)
  update(x)
  result = x

proc rotateLeft(x: AvlNode): AvlNode =
  let y = x.right
  let t2 = y.left
  y.left = x
  x.right = t2
  update(x)
  update(y)
  result = y

proc insert(node: AvlNode, value: int): AvlNode =
  if node == nil:
    return AvlNode(value: value, height: 1)
  if value < node.value:
    node.left = insert(node.left, value)
  elif value > node.value:
    node.right = insert(node.right, value)
  else:
    return node

  update(node)
  let bf = balanceFactor(node)

  if bf > 1 and value < node.left.value:
    return rotateRight(node)
  if bf < -1 and value > node.right.value:
    return rotateLeft(node)
  if bf > 1 and value > node.left.value:
    node.left = rotateLeft(node.left)
    return rotateRight(node)
  if bf < -1 and value < node.right.value:
    node.right = rotateRight(node.right)
    return rotateLeft(node)

  result = node

proc inorder(node: AvlNode, res: var seq[int]) =
  if node == nil:
    return
  inorder(node.left, res)
  res.add(node.value)
  inorder(node.right, res)

var root: AvlNode = nil
for v in [10, 20, 30, 40, 50, 25]:
  root = insert(root, v)

var res: seq[int] = @[]
inorder(root, res)
echo res
echo height(root)
