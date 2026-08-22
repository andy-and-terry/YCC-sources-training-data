final class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class BinaryTree {
    private var root: TreeNode?

    func insert(_ value: Int) {
        root = insertNode(root, value)
    }

    private func insertNode(_ node: TreeNode?, _ value: Int) -> TreeNode {
        guard let node = node else {
            return TreeNode(value)
        }
        if value < node.value {
            node.left = insertNode(node.left, value)
        } else {
            node.right = insertNode(node.right, value)
        }
        return node
    }

    func inorder() -> [Int] {
        var result: [Int] = []
        traverse(root, &result)
        return result
    }

    private func traverse(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else { return }
        traverse(node.left, &result)
        result.append(node.value)
        traverse(node.right, &result)
    }
}

let tree = BinaryTree()
[5, 3, 8, 1, 4, 7, 9].forEach { tree.insert($0) }
print(tree.inorder())
