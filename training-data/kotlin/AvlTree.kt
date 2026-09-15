class AvlNode(val value: Int) {
    var left: AvlNode? = null
    var right: AvlNode? = null
    var height: Int = 1
}

class AvlTree {
    private var root: AvlNode? = null

    private fun height(node: AvlNode?): Int = node?.height ?: 0

    private fun balanceFactor(node: AvlNode?): Int =
        if (node == null) 0 else height(node.left) - height(node.right)

    private fun updateHeight(node: AvlNode) {
        node.height = 1 + maxOf(height(node.left), height(node.right))
    }

    private fun rotateRight(y: AvlNode): AvlNode {
        val x = y.left!!
        val t2 = x.right
        x.right = y
        y.left = t2
        updateHeight(y)
        updateHeight(x)
        return x
    }

    private fun rotateLeft(x: AvlNode): AvlNode {
        val y = x.right!!
        val t2 = y.left
        y.left = x
        x.right = t2
        updateHeight(x)
        updateHeight(y)
        return y
    }

    fun insert(value: Int) {
        root = insert(root, value)
    }

    private fun insert(node: AvlNode?, value: Int): AvlNode {
        if (node == null) return AvlNode(value)
        when {
            value < node.value -> node.left = insert(node.left, value)
            value > node.value -> node.right = insert(node.right, value)
            else -> return node
        }

        updateHeight(node)
        val balance = balanceFactor(node)

        if (balance > 1 && value < node.left!!.value) return rotateRight(node)
        if (balance < -1 && value > node.right!!.value) return rotateLeft(node)
        if (balance > 1 && value > node.left!!.value) {
            node.left = rotateLeft(node.left!!)
            return rotateRight(node)
        }
        if (balance < -1 && value < node.right!!.value) {
            node.right = rotateRight(node.right!!)
            return rotateLeft(node)
        }
        return node
    }

    fun inOrder(): List<Int> {
        val result = mutableListOf<Int>()
        fun walk(node: AvlNode?) {
            if (node == null) return
            walk(node.left)
            result.add(node.value)
            walk(node.right)
        }
        walk(root)
        return result
    }
}

fun main() {
    val tree = AvlTree()
    listOf(10, 20, 30, 40, 50, 25).forEach { tree.insert(it) }
    println(tree.inOrder())
}
