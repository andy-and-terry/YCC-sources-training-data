class AVLNode:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None
        self.height = 1


def _height(node):
    return node.height if node else 0


def _balance_factor(node):
    return _height(node.left) - _height(node.right) if node else 0


def _update_height(node):
    node.height = 1 + max(_height(node.left), _height(node.right))


def _rotate_right(y):
    x = y.left
    y.left = x.right
    x.right = y
    _update_height(y)
    _update_height(x)
    return x


def _rotate_left(x):
    y = x.right
    x.right = y.left
    y.left = x
    _update_height(x)
    _update_height(y)
    return y


def insert(node, key):
    if node is None:
        return AVLNode(key)
    if key < node.key:
        node.left = insert(node.left, key)
    elif key > node.key:
        node.right = insert(node.right, key)
    else:
        return node

    _update_height(node)
    balance = _balance_factor(node)

    if balance > 1 and key < node.left.key:
        return _rotate_right(node)
    if balance < -1 and key > node.right.key:
        return _rotate_left(node)
    if balance > 1 and key > node.left.key:
        node.left = _rotate_left(node.left)
        return _rotate_right(node)
    if balance < -1 and key < node.right.key:
        node.right = _rotate_right(node.right)
        return _rotate_left(node)

    return node


def inorder(node, out=None):
    if out is None:
        out = []
    if node:
        inorder(node.left, out)
        out.append(node.key)
        inorder(node.right, out)
    return out


if __name__ == "__main__":
    root = None
    for value in [10, 20, 30, 40, 50, 25]:
        root = insert(root, value)
    print(inorder(root))
    print("root balanced at", root.key, "height", root.height)
