public class FenwickTreeRangeUpdate {
    // A Fenwick tree can support O(log n) range-update / point-query by
    // storing the difference array instead of the raw values, unlike the
    // point-update / range-query tree in FenwickTree.java.
    private final int[] tree;
    private final int size;

    public FenwickTreeRangeUpdate(int size) {
        this.size = size;
        tree = new int[size + 1];
    }

    private void add(int index, int delta) {
        index += 1;
        while (index <= size) {
            tree[index] += delta;
            index += index & (-index);
        }
    }

    public void rangeUpdate(int left, int right, int delta) {
        add(left, delta);
        add(right + 1, -delta);
    }

    public int pointQuery(int index) {
        index += 1;
        int total = 0;
        while (index > 0) {
            total += tree[index];
            index -= index & (-index);
        }
        return total;
    }

    public static void main(String[] args) {
        FenwickTreeRangeUpdate ft = new FenwickTreeRangeUpdate(6);
        ft.rangeUpdate(1, 3, 5);
        ft.rangeUpdate(2, 4, 2);
        for (int i = 0; i < 6; i++) {
            System.out.println("value at " + i + ": " + ft.pointQuery(i));
        }
    }
}
