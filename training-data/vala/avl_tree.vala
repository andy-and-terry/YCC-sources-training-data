class AvlNode {
    public int value;
    public AvlNode? left = null;
    public AvlNode? right = null;
    public int height = 1;

    public AvlNode(int value) {
        this.value = value;
    }
}

class AvlTree : Object {
    private AvlNode? root = null;

    private int node_height(AvlNode? node) {
        return node == null ? 0 : node.height;
    }

    private int balance_factor(AvlNode? node) {
        if (node == null) return 0;
        return node_height(node.left) - node_height(node.right);
    }

    private void update_height(AvlNode node) {
        node.height = 1 + int.max(node_height(node.left), node_height(node.right));
    }

    private AvlNode rotate_right(AvlNode y) {
        AvlNode x = (!) y.left;
        AvlNode? t2 = x.right;
        x.right = y;
        y.left = t2;
        update_height(y);
        update_height(x);
        return x;
    }

    private AvlNode rotate_left(AvlNode x) {
        AvlNode y = (!) x.right;
        AvlNode? t2 = y.left;
        y.left = x;
        x.right = t2;
        update_height(x);
        update_height(y);
        return y;
    }

    private AvlNode insert_node(AvlNode? node, int value) {
        if (node == null) {
            return new AvlNode(value);
        }
        if (value < node.value) {
            node.left = insert_node(node.left, value);
        } else if (value > node.value) {
            node.right = insert_node(node.right, value);
        } else {
            return node;
        }

        update_height(node);
        int balance = balance_factor(node);

        if (balance > 1 && value < ((!) node.left).value) {
            return rotate_right(node);
        }
        if (balance < -1 && value > ((!) node.right).value) {
            return rotate_left(node);
        }
        if (balance > 1 && value > ((!) node.left).value) {
            node.left = rotate_left((!) node.left);
            return rotate_right(node);
        }
        if (balance < -1 && value < ((!) node.right).value) {
            node.right = rotate_right((!) node.right);
            return rotate_left(node);
        }
        return node;
    }

    public void insert(int value) {
        root = insert_node(root, value);
    }

    private void inorder_visit(AvlNode? node, ref int[] result) {
        if (node == null) return;
        inorder_visit(node.left, ref result);
        result += node.value;
        inorder_visit(node.right, ref result);
    }

    public int[] inorder() {
        int[] result = {};
        inorder_visit(root, ref result);
        return result;
    }

    public int tree_height() {
        return node_height(root);
    }
}

void main() {
    var tree = new AvlTree();
    foreach (int value in new int[] {10, 20, 30, 40, 50, 25}) {
        tree.insert(value);
    }

    var sb = new StringBuilder();
    foreach (int value in tree.inorder()) {
        sb.append_printf("%d ", value);
    }
    stdout.printf("%s\n", sb.str.strip());
    stdout.printf("height: %d\n", tree.tree_height());
}
