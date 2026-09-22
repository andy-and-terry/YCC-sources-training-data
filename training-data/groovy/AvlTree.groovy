class AvlNode {
    int value
    int height = 1
    AvlNode left
    AvlNode right

    AvlNode(int v) {
        value = v
    }
}

class AvlTree {
    AvlNode root

    int height(AvlNode node) {
        return node == null ? 0 : node.height
    }

    int balanceFactor(AvlNode node) {
        return node == null ? 0 : height(node.left) - height(node.right)
    }

    AvlNode rotateRight(AvlNode y) {
        AvlNode x = y.left
        AvlNode t2 = x.right
        x.right = y
        y.left = t2
        y.height = Math.max(height(y.left), height(y.right)) + 1
        x.height = Math.max(height(x.left), height(x.right)) + 1
        return x
    }

    AvlNode rotateLeft(AvlNode x) {
        AvlNode y = x.right
        AvlNode t2 = y.left
        y.left = x
        x.right = t2
        x.height = Math.max(height(x.left), height(x.right)) + 1
        y.height = Math.max(height(y.left), height(y.right)) + 1
        return y
    }

    AvlNode insert(AvlNode node, int value) {
        if (node == null) return new AvlNode(value)
        if (value < node.value) {
            node.left = insert(node.left, value)
        } else if (value > node.value) {
            node.right = insert(node.right, value)
        } else {
            return node
        }

        node.height = 1 + Math.max(height(node.left), height(node.right))
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

    void insert(int value) {
        root = insert(root, value)
    }

    List<Integer> inorder() {
        def result = []
        def visit
        visit = { AvlNode node ->
            if (node == null) return
            visit(node.left)
            result << node.value
            visit(node.right)
        }
        visit(root)
        return result
    }
}

def tree = new AvlTree()
[10, 20, 30, 40, 50, 25].each { tree.insert(it) }
println tree.inorder()
println tree.height(tree.root)
