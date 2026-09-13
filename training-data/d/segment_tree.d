import std.stdio;

class SegmentTree {
    private int[] tree;
    private int n;

    this(int[] data) {
        n = cast(int) data.length;
        tree = new int[4 * n];
        build(data, 1, 0, n - 1);
    }

    private void build(int[] data, int node, int left, int right) {
        if (left == right) {
            tree[node] = data[left];
            return;
        }
        int mid = (left + right) / 2;
        build(data, node * 2, left, mid);
        build(data, node * 2 + 1, mid + 1, right);
        tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }

    int query(int ql, int qr) {
        return queryRange(1, 0, n - 1, ql, qr);
    }

    private int queryRange(int node, int left, int right, int ql, int qr) {
        if (qr < left || right < ql) return 0;
        if (ql <= left && right <= qr) return tree[node];
        int mid = (left + right) / 2;
        return queryRange(node * 2, left, mid, ql, qr) + queryRange(node * 2 + 1, mid + 1, right, ql, qr);
    }

    void update(int index, int value) {
        updateAt(1, 0, n - 1, index, value);
    }

    private void updateAt(int node, int left, int right, int index, int value) {
        if (left == right) {
            tree[node] = value;
            return;
        }
        int mid = (left + right) / 2;
        if (index <= mid) updateAt(node * 2, left, mid, index, value);
        else updateAt(node * 2 + 1, mid + 1, right, index, value);
        tree[node] = tree[node * 2] + tree[node * 2 + 1];
    }
}

void main() {
    auto data = [1, 3, 5, 7, 9, 11];
    auto tree = new SegmentTree(data);
    writeln(tree.query(1, 3));
    tree.update(1, 10);
    writeln(tree.query(1, 3));
}
