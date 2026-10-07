import std.stdio;
import std.algorithm;

class TreeNode {
    int value;
    TreeNode left;
    TreeNode right;

    this(int value) {
        this.value = value;
    }
}

int maxDiameter;

int height(TreeNode node) {
    if (node is null) return 0;
    int leftHeight = height(node.left);
    int rightHeight = height(node.right);
    maxDiameter = max(maxDiameter, leftHeight + rightHeight);
    return max(leftHeight, rightHeight) + 1;
}

int diameter(TreeNode root) {
    maxDiameter = 0;
    height(root);
    return maxDiameter;
}

void main() {
    auto root = new TreeNode(1);
    root.left = new TreeNode(2);
    root.right = new TreeNode(3);
    root.left.left = new TreeNode(4);
    root.left.right = new TreeNode(5);
    writeln(diameter(root));
}
