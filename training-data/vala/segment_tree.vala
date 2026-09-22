class SegmentTree : Object {
    int[] tree;
    int n;

    public SegmentTree(int[] values) {
        n = values.length;
        tree = new int[4 * n];
        build(values, 0, 0, n - 1);
    }

    void build(int[] values, int node, int left, int right) {
        if (left == right) {
            tree[node] = values[left];
            return;
        }
        int mid = (left + right) / 2;
        build(values, 2 * node + 1, left, mid);
        build(values, 2 * node + 2, mid + 1, right);
        tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
    }

    public int query(int qlow, int qhigh) {
        return query_range(0, 0, n - 1, qlow, qhigh);
    }

    int query_range(int node, int left, int right, int qlow, int qhigh) {
        if (qhigh < left || right < qlow) return 0;
        if (qlow <= left && right <= qhigh) return tree[node];
        int mid = (left + right) / 2;
        return query_range(2 * node + 1, left, mid, qlow, qhigh)
            + query_range(2 * node + 2, mid + 1, right, qlow, qhigh);
    }

    public void update(int index, int value) {
        update_index(0, 0, n - 1, index, value);
    }

    void update_index(int node, int left, int right, int index, int value) {
        if (left == right) {
            tree[node] = value;
            return;
        }
        int mid = (left + right) / 2;
        if (index <= mid) {
            update_index(2 * node + 1, left, mid, index, value);
        } else {
            update_index(2 * node + 2, mid + 1, right, index, value);
        }
        tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
    }
}

void main() {
    int[] values = { 1, 3, 5, 7, 9, 11 };
    var seg = new SegmentTree(values);
    stdout.printf("%d\n", seg.query(1, 3));
    seg.update(1, 10);
    stdout.printf("%d\n", seg.query(1, 3));
}
