public class AVLTree {
    public class Node {
        public Integer value;
        public Integer height;
        public Node left;
        public Node right;

        public Node(Integer value) {
            this.value = value;
            this.height = 1;
        }
    }

    private Node root;

    private Integer heightOf(Node n) {
        return n == null ? 0 : n.height;
    }

    private Integer balanceFactor(Node n) {
        return n == null ? 0 : heightOf(n.left) - heightOf(n.right);
    }

    private Node rotateRight(Node y) {
        Node x = y.left;
        Node t2 = x.right;
        x.right = y;
        y.left = t2;
        y.height = Math.max(heightOf(y.left), heightOf(y.right)) + 1;
        x.height = Math.max(heightOf(x.left), heightOf(x.right)) + 1;
        return x;
    }

    private Node rotateLeft(Node x) {
        Node y = x.right;
        Node t2 = y.left;
        y.left = x;
        x.right = t2;
        x.height = Math.max(heightOf(x.left), heightOf(x.right)) + 1;
        y.height = Math.max(heightOf(y.left), heightOf(y.right)) + 1;
        return y;
    }

    public Node insert(Node n, Integer value) {
        if (n == null) {
            return new Node(value);
        }
        if (value < n.value) {
            n.left = insert(n.left, value);
        } else if (value > n.value) {
            n.right = insert(n.right, value);
        } else {
            return n;
        }

        n.height = Math.max(heightOf(n.left), heightOf(n.right)) + 1;
        Integer balance = balanceFactor(n);

        if (balance > 1 && value < n.left.value) {
            return rotateRight(n);
        }
        if (balance < -1 && value > n.right.value) {
            return rotateLeft(n);
        }
        if (balance > 1 && value > n.left.value) {
            n.left = rotateLeft(n.left);
            return rotateRight(n);
        }
        if (balance < -1 && value < n.right.value) {
            n.right = rotateRight(n.right);
            return rotateLeft(n);
        }
        return n;
    }

    private void inorder(Node n, List<Integer> out) {
        if (n != null) {
            inorder(n.left, out);
            out.add(n.value);
            inorder(n.right, out);
        }
    }

    public static void main() {
        AVLTree tree = new AVLTree();
        for (Integer v : new List<Integer>{10, 20, 30, 40, 50, 25}) {
            tree.root = tree.insert(tree.root, v);
        }
        List<Integer> out = new List<Integer>();
        tree.inorder(tree.root, out);
        System.debug(out);
        System.debug(tree.root.height);
    }
}
