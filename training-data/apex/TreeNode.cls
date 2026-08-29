public class TreeNode {
    public Integer val;
    public TreeNode left;
    public TreeNode right;

    public TreeNode(Integer val) {
        this.val = val;
    }

    public static TreeNode insert(TreeNode node, Integer val) {
        if (node == null) {
            return new TreeNode(val);
        }
        if (val < node.val) {
            node.left = insert(node.left, val);
        } else if (val > node.val) {
            node.right = insert(node.right, val);
        }
        return node;
    }

    public static void inorder(TreeNode node, List<Integer> result) {
        if (node == null) {
            return;
        }
        inorder(node.left, result);
        result.add(node.val);
        inorder(node.right, result);
    }

    public static void main() {
        TreeNode root = null;
        for (Integer v : new List<Integer>{5, 3, 8, 1, 4, 7, 9}) {
            root = insert(root, v);
        }
        List<Integer> result = new List<Integer>();
        inorder(root, result);
        System.debug(result);
    }
}
