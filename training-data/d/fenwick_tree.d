import std.stdio;

class FenwickTree {
    private int[] tree;
    private int size;

    this(int size) {
        this.size = size;
        tree = new int[size + 1];
    }

    void add(int index, int delta) {
        for (int i = index + 1; i <= size; i += i & (-i)) tree[i] += delta;
    }

    int prefixSum(int index) {
        int total = 0;
        for (int i = index + 1; i > 0; i -= i & (-i)) total += tree[i];
        return total;
    }

    int rangeSum(int left, int right) {
        return left > 0 ? prefixSum(right) - prefixSum(left - 1) : prefixSum(right);
    }
}

void main() {
    auto values = [1, 3, 5, 7, 9, 11];
    auto tree = new FenwickTree(cast(int) values.length);
    foreach (i, v; values) tree.add(cast(int) i, v);

    writeln(tree.rangeSum(1, 3));
    tree.add(1, 10);
    writeln(tree.rangeSum(1, 3));
}
