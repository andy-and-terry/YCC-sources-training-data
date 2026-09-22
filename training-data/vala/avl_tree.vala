class AVLNode : Object {
    public int key;
    public AVLNode? left = null;
    public AVLNode? right = null;
    public int height = 1;

    public AVLNode(int key) {
        this.key = key;
    }
}

int node_height(AVLNode? node) {
    return node == null ? 0 : node.height;
}

void update_height(AVLNode node) {
    node.height = 1 + int.max(node_height(node.left), node_height(node.right));
}

AVLNode rotate_right(AVLNode y) {
    AVLNode x = y.left;
    AVLNode? t2 = x.right;
    x.right = y;
    y.left = t2;
    update_height(y);
    update_height(x);
    return x;
}

AVLNode rotate_left(AVLNode x) {
    AVLNode y = x.right;
    AVLNode? t2 = y.left;
    y.left = x;
    x.right = t2;
    update_height(x);
    update_height(y);
    return y;
}

AVLNode insert_node(AVLNode? node, int key) {
    if (node == null) {
        return new AVLNode(key);
    }
    if (key < node.key) {
        node.left = insert_node(node.left, key);
    } else if (key > node.key) {
        node.right = insert_node(node.right, key);
    } else {
        return node;
    }

    update_height(node);
    int balance = node_height(node.left) - node_height(node.right);

    if (balance > 1 && key < node.left.key) {
        return rotate_right(node);
    }
    if (balance < -1 && key > node.right.key) {
        return rotate_left(node);
    }
    if (balance > 1 && key > node.left.key) {
        node.left = rotate_left(node.left);
        return rotate_right(node);
    }
    if (balance < -1 && key < node.right.key) {
        node.right = rotate_right(node.right);
        return rotate_left(node);
    }
    return node;
}

void in_order(AVLNode? node, ref int[] result) {
    if (node == null) return;
    in_order(node.left, ref result);
    result += node.key;
    in_order(node.right, ref result);
}

void main() {
    AVLNode? root = null;
    int[] values = { 10, 20, 30, 40, 50, 25 };
    foreach (int v in values) {
        root = insert_node(root, v);
    }

    int[] result = {};
    in_order(root, ref result);
    foreach (int x in result) {
        stdout.printf("%d ", x);
    }
    stdout.printf("\n");
    stdout.printf("%d\n", node_height(root));
}
