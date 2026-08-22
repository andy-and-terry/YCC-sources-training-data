class TreeNode {
  final int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertNode(root, value);
  }

  TreeNode _insertNode(TreeNode? node, int value) {
    if (node == null) return TreeNode(value);
    if (value < node.value) {
      node.left = _insertNode(node.left, value);
    } else {
      node.right = _insertNode(node.right, value);
    }
    return node;
  }

  List<int> inorder() {
    final result = <int>[];
    void traverse(TreeNode? node) {
      if (node == null) return;
      traverse(node.left);
      result.add(node.value);
      traverse(node.right);
    }

    traverse(root);
    return result;
  }
}

void main() {
  final tree = BinaryTree();
  for (final v in [5, 3, 8, 1, 4, 7, 9]) {
    tree.insert(v);
  }
  print(tree.inorder());
}
