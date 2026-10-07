import std.stdio;

class TreeNode {
    int value;
    TreeNode left;
    TreeNode right;

    this(int value) {
        this.value = value;
    }
}

TreeNode lca(TreeNode node, int p, int q) {
    if (node is null) return null;
    if (node.value == p || node.value == q) return node;

    auto left = lca(node.left, p, q);
    auto right = lca(node.right, p, q);

    if (left !is null && right !is null) return node;
    return left !is null ? left : right;
}

void main() {
    auto root = new TreeNode(6);
    root.left = new TreeNode(2);
    root.right = new TreeNode(8);
    root.left.left = new TreeNode(0);
    root.left.right = new TreeNode(4);

    auto result = lca(root, 0, 4);
    writeln(result.value);
}
