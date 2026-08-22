class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BinaryTree:
    def __init__(self):
        self.root = None

    def insert(self, value):
        if self.root is None:
            self.root = Node(value)
            return
        self._insert(self.root, value)

    def _insert(self, node, value):
        if value < node.value:
            if node.left is None:
                node.left = Node(value)
            else:
                self._insert(node.left, value)
        else:
            if node.right is None:
                node.right = Node(value)
            else:
                self._insert(node.right, value)

    def in_order(self):
        result = []
        self._in_order(self.root, result)
        return result

    def _in_order(self, node, result):
        if node is None:
            return
        self._in_order(node.left, result)
        result.append(node.value)
        self._in_order(node.right, result)


if __name__ == "__main__":
    tree = BinaryTree()
    for v in [5, 3, 8, 1, 4, 7, 9]:
        tree.insert(v)
    print(tree.in_order())
