final class AVLNode {
    var value: Int
    var height: Int = 1
    var left: AVLNode?
    var right: AVLNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class AVLTree {
    private var root: AVLNode?

    private func height(_ node: AVLNode?) -> Int {
        node?.height ?? 0
    }

    private func balanceFactor(_ node: AVLNode) -> Int {
        height(node.left) - height(node.right)
    }

    private func updateHeight(_ node: AVLNode) {
        node.height = 1 + max(height(node.left), height(node.right))
    }

    private func rotateRight(_ y: AVLNode) -> AVLNode {
        let x = y.left!
        let t2 = x.right
        x.right = y
        y.left = t2
        updateHeight(y)
        updateHeight(x)
        return x
    }

    private func rotateLeft(_ x: AVLNode) -> AVLNode {
        let y = x.right!
        let t2 = y.left
        y.left = x
        x.right = t2
        updateHeight(x)
        updateHeight(y)
        return y
    }

    private func insert(_ node: AVLNode?, _ value: Int) -> AVLNode {
        guard let node = node else { return AVLNode(value) }

        if value < node.value {
            node.left = insert(node.left, value)
        } else if value > node.value {
            node.right = insert(node.right, value)
        } else {
            return node
        }

        updateHeight(node)
        let balance = balanceFactor(node)

        if balance > 1 && value < node.left!.value {
            return rotateRight(node)
        }
        if balance < -1 && value > node.right!.value {
            return rotateLeft(node)
        }
        if balance > 1 && value > node.left!.value {
            node.left = rotateLeft(node.left!)
            return rotateRight(node)
        }
        if balance < -1 && value < node.right!.value {
            node.right = rotateRight(node.right!)
            return rotateLeft(node)
        }
        return node
    }

    func insert(_ value: Int) {
        root = insert(root, value)
    }

    func inorder() -> [Int] {
        var result: [Int] = []
        func visit(_ node: AVLNode?) {
            guard let node = node else { return }
            visit(node.left)
            result.append(node.value)
            visit(node.right)
        }
        visit(root)
        return result
    }

    var rootHeight: Int {
        height(root)
    }
}

let tree = AVLTree()
for value in [10, 20, 30, 40, 50, 25] {
    tree.insert(value)
}
print(tree.inorder())
print("height:", tree.rootHeight)
