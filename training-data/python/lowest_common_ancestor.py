class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right


def lowest_common_ancestor(root: Node, p, q):
    """Works for any binary tree (not just a BST): recurse into both
    subtrees, and a node is the LCA once p and q are found on different
    sides of it (or the node itself is one of them)."""
    if root is None or root.value == p or root.value == q:
        return root

    left = lowest_common_ancestor(root.left, p, q)
    right = lowest_common_ancestor(root.right, p, q)

    if left and right:
        return root
    return left if left else right


def lowest_common_ancestor_bst(root: Node, p, q):
    """A BST's ordering lets us skip the two-sided recursion entirely:
    walk down, branching only toward the side that could still contain
    both values."""
    node = root
    while node:
        if p < node.value and q < node.value:
            node = node.left
        elif p > node.value and q > node.value:
            node = node.right
        else:
            return node
    return None


if __name__ == "__main__":
    #        6
    #      /   \
    #     2     8
    #    / \   / \
    #   0   4 7   9
    #      / \
    #     3   5
    root = Node(6,
                Node(2, Node(0), Node(4, Node(3), Node(5))),
                Node(8, Node(7), Node(9)))

    print(lowest_common_ancestor(root, 2, 8).value)   # 6
    print(lowest_common_ancestor(root, 3, 5).value)   # 4
    print(lowest_common_ancestor(root, 0, 5).value)   # 2

    print(lowest_common_ancestor_bst(root, 2, 8).value)  # 6
    print(lowest_common_ancestor_bst(root, 3, 5).value)  # 4
