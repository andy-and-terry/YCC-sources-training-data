class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.value);
}

int _maxDiameter = 0;

int _height(TreeNode? node) {
  if (node == null) return 0;
  final leftHeight = _height(node.left);
  final rightHeight = _height(node.right);
  final total = leftHeight + rightHeight;
  if (total > _maxDiameter) _maxDiameter = total;
  return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
}

int diameter(TreeNode? root) {
  _maxDiameter = 0;
  _height(root);
  return _maxDiameter;
}

void main() {
  final root = TreeNode(1);
  root.left = TreeNode(2);
  root.right = TreeNode(3);
  root.left!.left = TreeNode(4);
  root.left!.right = TreeNode(5);
  print(diameter(root));
}
