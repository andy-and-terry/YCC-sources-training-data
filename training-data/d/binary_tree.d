import std.stdio;

class TreeNode {
    int value;
    TreeNode left, right;
    this(int value) { this.value = value; }
}

TreeNode insert(TreeNode node, int value) {
    if (node is null) return new TreeNode(value);
    if (value < node.value) node.left = insert(node.left, value);
    else node.right = insert(node.right, value);
    return node;
}

void inorder(TreeNode node, ref int[] result) {
    if (node is null) return;
    inorder(node.left, result);
    result ~= node.value;
    inorder(node.right, result);
}

void main() {
    TreeNode root;
    foreach (v; [5, 3, 8, 1, 4, 7, 9]) root = insert(root, v);
    int[] result;
    inorder(root, result);
    writeln(result);
}
