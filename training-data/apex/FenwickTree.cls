public class FenwickTree {
    private List<Integer> tree;
    private Integer n;

    public FenwickTree(Integer size) {
        this.n = size;
        this.tree = new List<Integer>();
        for (Integer i = 0; i <= size; i++) {
            tree.add(0);
        }
    }

    public void update(Integer index, Integer delta) {
        Integer i = index + 1;
        while (i <= n) {
            tree[i] = tree[i] + delta;
            i += i & (-i);
        }
    }

    public Integer prefixSum(Integer index) {
        Integer i = index + 1;
        Integer total = 0;
        while (i > 0) {
            total += tree[i];
            i -= i & (-i);
        }
        return total;
    }

    public Integer rangeSum(Integer left, Integer right) {
        return prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0);
    }

    public static void main() {
        FenwickTree bit = new FenwickTree(8);
        List<Integer> values = new List<Integer>{3, 2, -1, 6, 5, 4, -3, 3};
        for (Integer i = 0; i < values.size(); i++) {
            bit.update(i, values[i]);
        }
        System.debug(bit.prefixSum(5));
        System.debug(bit.rangeSum(2, 6));
    }
}
