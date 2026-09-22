class SegmentTree {
    int[] tree
    int n

    SegmentTree(int[] values) {
        n = values.length
        tree = new int[4 * n]
        if (n > 0) build(values, 1, 0, n - 1)
    }

    void build(int[] values, int node, int start, int end) {
        if (start == end) {
            tree[node] = values[start]
            return
        }
        int mid = (start + end).intdiv(2)
        build(values, node * 2, start, mid)
        build(values, node * 2 + 1, mid + 1, end)
        tree[node] = tree[node * 2] + tree[node * 2 + 1]
    }

    int query(int node, int start, int end, int l, int r) {
        if (r < start || end < l) return 0
        if (l <= start && end <= r) return tree[node]
        int mid = (start + end).intdiv(2)
        return query(node * 2, start, mid, l, r) + query(node * 2 + 1, mid + 1, end, l, r)
    }

    int rangeSum(int l, int r) {
        return query(1, 0, n - 1, l, r)
    }

    void update(int node, int start, int end, int idx, int value) {
        if (start == end) {
            tree[node] = value
            return
        }
        int mid = (start + end).intdiv(2)
        if (idx <= mid) {
            update(node * 2, start, mid, idx, value)
        } else {
            update(node * 2 + 1, mid + 1, end, idx, value)
        }
        tree[node] = tree[node * 2] + tree[node * 2 + 1]
    }

    void setValue(int idx, int value) {
        update(1, 0, n - 1, idx, value)
    }
}

def seg = new SegmentTree([1, 3, 5, 7, 9, 11] as int[])
println seg.rangeSum(1, 3)
seg.setValue(1, 10)
println seg.rangeSum(1, 3)
