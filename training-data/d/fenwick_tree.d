import std.stdio;

class FenwickTree {
    private int[] tree;
    private int size;

    this(int size) {
        this.size = size;
        tree = new int[](size + 1);
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
        return prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0);
    }
}

void main() {
    auto ft = new FenwickTree(6);
    int[] values = [1, 3, 5, 7, 9, 11];
    foreach (i, v; values) ft.add(cast(int) i, v);
    writeln(ft.rangeSum(1, 3));
    writeln(ft.prefixSum(5));
}
