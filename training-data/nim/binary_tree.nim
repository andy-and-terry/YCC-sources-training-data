type
  TreeNode = ref object
    value: int
    left, right: TreeNode

proc insert(node: TreeNode, value: int): TreeNode =
  if node == nil:
    return TreeNode(value: value)
  if value < node.value:
    node.left = insert(node.left, value)
  elif value > node.value:
    node.right = insert(node.right, value)
  result = node

proc inorder(node: TreeNode, res: var seq[int]) =
  if node == nil:
    return
  inorder(node.left, res)
  res.add(node.value)
  inorder(node.right, res)

var root: TreeNode = nil
for v in [5, 3, 8, 1, 4, 7, 9]:
  root = insert(root, v)
var res: seq[int] = @[]
inorder(root, res)
echo res
