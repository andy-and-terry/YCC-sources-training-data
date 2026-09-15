class AvlNode {
    int value
    AvlNode left, right
    int height = 1

    AvlNode(int v) { value = v }
}

class AvlTree {
    static int height(AvlNode node) {
        return node == null ? 0 : node.height
    }

    static int balanceFactor(AvlNode node) {
        return node == null ? 0 : height(node.left) - height(node.right)
    }

    static void updateHeight(AvlNode node) {
        node.height = 1 + Math.max(height(node.left), height(node.right))
    }

    static AvlNode rotateRight(AvlNode y) {
        AvlNode x = y.left
        AvlNode t2 = x.right
        x.right = y
        y.left = t2
        updateHeight(y)
        updateHeight(x)
        return x
    }

    static AvlNode rotateLeft(AvlNode x) {
        AvlNode y = x.right
        AvlNode t2 = y.left
        y.left = x
        x.right = t2
        updateHeight(x)
        updateHeight(y)
        return y
    }

    static AvlNode insert(AvlNode node, int value) {
        if (node == null) return new AvlNode(value)
        if (value < node.value) {
            node.left = insert(node.left, value)
        } else if (value > node.value) {
            node.right = insert(node.right, value)
        } else {
            return node
        }

        updateHeight(node)
        int balance = balanceFactor(node)

        if (balance > 1 && value < node.left.value) return rotateRight(node)
        if (balance < -1 && value > node.right.value) return rotateLeft(node)
        if (balance > 1 && value > node.left.value) {
            node.left = rotateLeft(node.left)
            return rotateRight(node)
        }
        if (balance < -1 && value < node.right.value) {
            node.right = rotateRight(node.right)
            return rotateLeft(node)
        }
        return node
    }

    static void inorder(AvlNode node, List result) {
        if (node == null) return
        inorder(node.left, result)
        result << node.value
        inorder(node.right, result)
    }
}

AvlNode root = null
[10, 20, 30, 40, 50, 25].each { root = AvlTree.insert(root, it) }
def result = []
AvlTree.inorder(root, result)
println result
println "root=${root.value} height=${root.height}"
