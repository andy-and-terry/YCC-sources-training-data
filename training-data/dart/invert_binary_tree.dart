class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.value);
}

TreeNode? invert(TreeNode? node) {
  if (node == null) return null;
  final left = invert(node.right);
  final right = invert(node.left);
  node.left = left;
  node.right = right;
  return node;
}

void inorder(TreeNode? node, List<int> result) {
  if (node == null) return;
  inorder(node.left, result);
  result.add(node.value);
  inorder(node.right, result);
}

void main() {
  final root = TreeNode(4);
  root.left = TreeNode(2);
  root.right = TreeNode(7);
  root.left!.left = TreeNode(1);
  root.left!.right = TreeNode(3);

  invert(root);
  final result = <int>[];
  inorder(root, result);
  print(result);
}
