class SegmentTree {
    int[] tree
    int n

    SegmentTree(int[] data) {
        n = data.length
        tree = new int[2 * n]
        System.arraycopy(data, 0, tree, n, n)
        for (int i = n - 1; i > 0; i--) {
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }

    void update(int index, int value) {
        int i = index + n
        tree[i] = value
        while (i > 1) {
            i /= 2
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }

    int query(int left, int right) {
        int l = left + n
        int r = right + n
        int total = 0
        while (l < r) {
            if ((l & 1) == 1) total += tree[l++]
            if ((r & 1) == 1) total += tree[--r]
            l /= 2
            r /= 2
        }
        return total
    }
}

def tree = new SegmentTree([1, 3, 5, 7, 9, 11] as int[])
println tree.query(1, 4)
tree.update(1, 10)
println tree.query(1, 4)
