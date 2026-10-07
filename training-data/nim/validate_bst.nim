type
  TreeNode = ref object
    value: int
    left, right: TreeNode

proc isValidBst(node: TreeNode, lo, hi: int): bool =
  if node == nil:
    return true
  if node.value <= lo or node.value >= hi:
    return false
  result = isValidBst(node.left, lo, node.value) and isValidBst(node.right, node.value, hi)

proc isValidBst(root: TreeNode): bool =
  isValidBst(root, low(int), high(int))

let valid = TreeNode(value: 5,
  left: TreeNode(value: 3, left: TreeNode(value: 1), right: TreeNode(value: 4)),
  right: TreeNode(value: 8))

let invalid = TreeNode(value: 5,
  left: TreeNode(value: 3),
  right: TreeNode(value: 4))

echo isValidBst(valid)
echo isValidBst(invalid)
