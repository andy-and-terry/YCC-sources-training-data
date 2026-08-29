class TreeNode : Object {
    public int value;
    public TreeNode? left;
    public TreeNode? right;

    public TreeNode(int v) {
        value = v;
    }
}

TreeNode insert_node(TreeNode? node, int value) {
    if (node == null) return new TreeNode(value);
    if (value < node.value) {
        node.left = insert_node(node.left, value);
    } else if (value > node.value) {
        node.right = insert_node(node.right, value);
    }
    return node;
}

void inorder(TreeNode? node, ref int[] result) {
    if (node == null) return;
    inorder(node.left, ref result);
    result += node.value;
    inorder(node.right, ref result);
}

void main() {
    TreeNode? root = null;
    int[] values = { 5, 3, 8, 1, 4, 7, 9 };
    foreach (int v in values) {
        root = insert_node(root, v);
    }
    int[] result = {};
    inorder(root, ref result);
    foreach (int x in result) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
}
