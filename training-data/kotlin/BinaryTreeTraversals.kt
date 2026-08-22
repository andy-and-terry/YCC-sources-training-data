class TreeNode(val value: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun insert(root: TreeNode?, value: Int): TreeNode {
    if (root == null) return TreeNode(value)
    if (value < root.value) root.left = insert(root.left, value)
    else root.right = insert(root.right, value)
    return root
}

fun preorder(node: TreeNode?, result: MutableList<Int>) {
    if (node == null) return
    result.add(node.value)
    preorder(node.left, result)
    preorder(node.right, result)
}

fun postorder(node: TreeNode?, result: MutableList<Int>) {
    if (node == null) return
    postorder(node.left, result)
    postorder(node.right, result)
    result.add(node.value)
}

fun main() {
    var root: TreeNode? = null
    for (v in listOf(5, 3, 8, 1, 4, 7, 9)) root = insert(root, v)
    val pre = mutableListOf<Int>()
    val post = mutableListOf<Int>()
    preorder(root, pre)
    postorder(root, post)
    println(pre)
    println(post)
}
