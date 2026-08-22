class TreeNode(val value: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

class BinaryTree {
    private var root: TreeNode? = null

    fun insert(value: Int) {
        root = insertNode(root, value)
    }

    private fun insertNode(node: TreeNode?, value: Int): TreeNode {
        if (node == null) return TreeNode(value)
        if (value < node.value) node.left = insertNode(node.left, value)
        else node.right = insertNode(node.right, value)
        return node
    }

    fun inorder(): List<Int> {
        val result = mutableListOf<Int>()
        traverse(root, result)
        return result
    }

    private fun traverse(node: TreeNode?, result: MutableList<Int>) {
        if (node == null) return
        traverse(node.left, result)
        result.add(node.value)
        traverse(node.right, result)
    }
}

fun main() {
    val tree = BinaryTree()
    listOf(5, 3, 8, 1, 4, 7, 9).forEach { tree.insert(it) }
    println(tree.inorder())
}
