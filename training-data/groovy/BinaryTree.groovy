class TreeNode {
    int value
    TreeNode left, right
    TreeNode(int v) { value = v }
}

def insert(TreeNode node, int value) {
    if (node == null) return new TreeNode(value)
    if (value < node.value) {
        node.left = insert(node.left, value)
    } else if (value > node.value) {
        node.right = insert(node.right, value)
    }
    return node
}

def inorder(TreeNode node, List result) {
    if (node == null) return
    inorder(node.left, result)
    result << node.value
    inorder(node.right, result)
}

TreeNode root = null
[5, 3, 8, 1, 4, 7, 9].each { root = insert(root, it) }
def result = []
inorder(root, result)
println result
