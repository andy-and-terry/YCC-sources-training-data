class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.value);
}

TreeNode? lca(TreeNode? node, int p, int q) {
  if (node == null) return null;
  if (node.value == p || node.value == q) return node;

  final left = lca(node.left, p, q);
  final right = lca(node.right, p, q);

  if (left != null && right != null) return node;
  return left ?? right;
}

void main() {
  final root = TreeNode(6);
  root.left = TreeNode(2);
  root.right = TreeNode(8);
  root.left!.left = TreeNode(0);
  root.left!.right = TreeNode(4);

  final result = lca(root, 0, 4);
  print(result?.value);
}
