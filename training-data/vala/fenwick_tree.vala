class FenwickTree : Object {
    int[] tree;
    int n;

    public FenwickTree(int size) {
        n = size;
        tree = new int[n + 1];
    }

    public void update(int index, int delta) {
        int i = index + 1;
        while (i <= n) {
            tree[i] += delta;
            i += i & (-i);
        }
    }

    public int prefix_sum(int index) {
        int i = index + 1;
        int sum = 0;
        while (i > 0) {
            sum += tree[i];
            i -= i & (-i);
        }
        return sum;
    }

    public int range_sum(int left, int right) {
        if (left == 0) {
            return prefix_sum(right);
        }
        return prefix_sum(right) - prefix_sum(left - 1);
    }
}

void main() {
    var values = new int[] { 1, 3, 5, 7, 9, 11 };
    var fenwick = new FenwickTree(values.length);

    for (int i = 0; i < values.length; i++) {
        fenwick.update(i, values[i]);
    }

    stdout.printf("%d\n", fenwick.range_sum(1, 3));
    fenwick.update(1, 10 - 3);
    stdout.printf("%d\n", fenwick.range_sum(1, 3));
}
