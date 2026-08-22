public class SegmentTree {
    private final int n;
    private final int[] tree;

    public SegmentTree(int[] data) {
        n = data.length;
        tree = new int[2 * n];
        System.arraycopy(data, 0, tree, n, n);
        for (int i = n - 1; i > 0; i--) tree[i] = tree[2 * i] + tree[2 * i + 1];
    }

    public void update(int index, int value) {
        int i = index + n;
        tree[i] = value;
        while (i > 1) {
            i /= 2;
            tree[i] = tree[2 * i] + tree[2 * i + 1];
        }
    }

    public int query(int left, int right) {
        left += n;
        right += n;
        int total = 0;
        while (left < right) {
            if ((left & 1) == 1) total += tree[left++];
            if ((right & 1) == 1) total += tree[--right];
            left /= 2;
            right /= 2;
        }
        return total;
    }

    public static void main(String[] args) {
        SegmentTree tree = new SegmentTree(new int[] {1, 3, 5, 7, 9, 11});
        System.out.println(tree.query(1, 4));
        tree.update(1, 10);
        System.out.println(tree.query(1, 4));
    }
}
