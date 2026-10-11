public class LowestCommonAncestor {
    static class Node {
        int val;
        Node left, right;

        Node(int val, Node left, Node right) {
            this.val = val;
            this.left = left;
            this.right = right;
        }
    }

    static Node lca(Node root, Node p, Node q) {
        if (root == null || root == p || root == q) return root;
        Node l = lca(root.left, p, q);
        Node r = lca(root.right, p, q);
        if (l != null && r != null) return root;
        return l != null ? l : r;
    }

    public static void main(String[] args) {
        Node n4 = new Node(4, null, null);
        Node n7 = new Node(7, null, null);
        Node n2 = new Node(2, n7, n4);
        Node n0 = new Node(0, null, null);
        Node n8 = new Node(8, null, null);
        Node n1 = new Node(1, n0, n8);
        Node n6 = new Node(6, null, null);
        Node n5 = new Node(5, n6, n2);
        Node root = new Node(3, n5, n1);
        System.out.println(lca(root, n6, n4).val);
        System.out.println(lca(root, n5, n1).val);
        System.out.println(lca(root, n5, n4).val);
    }
}
