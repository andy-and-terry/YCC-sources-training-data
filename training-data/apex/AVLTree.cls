public class AVLTree {
    private class Node {
        Integer value;
        Node left;
        Node right;
        Integer height;

        Node(Integer value) {
            this.value = value;
            this.height = 1;
        }
    }

    private Node root;

    private Integer height(Node node) {
        return node == null ? 0 : node.height;
    }

    private Integer balanceFactor(Node node) {
        return node == null ? 0 : height(node.left) - height(node.right);
    }

    private Node rotateRight(Node y) {
        Node x = y.left;
        Node t2 = x.right;
        x.right = y;
        y.left = t2;
        y.height = Math.max(height(y.left), height(y.right)) + 1;
        x.height = Math.max(height(x.left), height(x.right)) + 1;
        return x;
    }

    private Node rotateLeft(Node x) {
        Node y = x.right;
        Node t2 = y.left;
        y.left = x;
        x.right = t2;
        x.height = Math.max(height(x.left), height(x.right)) + 1;
        y.height = Math.max(height(y.left), height(y.right)) + 1;
        return y;
    }

    private Node insertNode(Node node, Integer value) {
        if (node == null) {
            return new Node(value);
        }
        if (value < node.value) {
            node.left = insertNode(node.left, value);
        } else if (value > node.value) {
            node.right = insertNode(node.right, value);
        } else {
            return node;
        }

        node.height = Math.max(height(node.left), height(node.right)) + 1;
        Integer balance = balanceFactor(node);

        if (balance > 1 && value < node.left.value) {
            return rotateRight(node);
        }
        if (balance < -1 && value > node.right.value) {
            return rotateLeft(node);
        }
        if (balance > 1 && value > node.left.value) {
            node.left = rotateLeft(node.left);
            return rotateRight(node);
        }
        if (balance < -1 && value < node.right.value) {
            node.right = rotateRight(node.right);
            return rotateLeft(node);
        }
        return node;
    }

    public void insert(Integer value) {
        root = insertNode(root, value);
    }

    private void inorderCollect(Node node, List<Integer> result) {
        if (node == null) {
            return;
        }
        inorderCollect(node.left, result);
        result.add(node.value);
        inorderCollect(node.right, result);
    }

    public List<Integer> inorder() {
        List<Integer> result = new List<Integer>();
        inorderCollect(root, result);
        return result;
    }

    public Integer height() {
        return height(root);
    }

    public static void main() {
        AVLTree tree = new AVLTree();
        List<Integer> values = new List<Integer>{10, 20, 30, 40, 50, 25};
        for (Integer v : values) {
            tree.insert(v);
        }
        System.debug(tree.inorder());
        System.debug(tree.height());
    }
}
