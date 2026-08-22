public class FenwickTree {
    private final int[] tree;
    private final int size;

    public FenwickTree(int size) {
        this.size = size;
        tree = new int[size + 1];
    }

    public void add(int index, int delta) {
        index += 1;
        while (index <= size) {
            tree[index] += delta;
            index += index & (-index);
        }
    }

    public int prefixSum(int index) {
        index += 1;
        int total = 0;
        while (index > 0) {
            total += tree[index];
            index -= index & (-index);
        }
        return total;
    }

    public int rangeSum(int left, int right) {
        return prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0);
    }

    public static void main(String[] args) {
        FenwickTree ft = new FenwickTree(6);
        int[] values = {1, 3, 5, 7, 9, 11};
        for (int i = 0; i < values.length; i++) ft.add(i, values[i]);
        System.out.println(ft.rangeSum(1, 3));
    }
}
