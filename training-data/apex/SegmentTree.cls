public class SegmentTree {
    private List<Integer> tree;
    private List<Integer> data;
    private Integer n;

    public SegmentTree(List<Integer> values) {
        this.data = values;
        this.n = values.size();
        this.tree = new List<Integer>();
        for (Integer i = 0; i < 4 * n; i++) {
            tree.add(0);
        }
        build(0, 0, n - 1);
    }

    private void build(Integer node, Integer l, Integer r) {
        if (l == r) {
            tree[node] = data[l];
            return;
        }
        Integer mid = (l + r) / 2;
        build(2 * node + 1, l, mid);
        build(2 * node + 2, mid + 1, r);
        tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
    }

    public Integer query(Integer node, Integer l, Integer r, Integer ql, Integer qr) {
        if (qr < l || r < ql) {
            return 0;
        }
        if (ql <= l && r <= qr) {
            return tree[node];
        }
        Integer mid = (l + r) / 2;
        return query(2 * node + 1, l, mid, ql, qr) + query(2 * node + 2, mid + 1, r, ql, qr);
    }

    public static void main() {
        SegmentTree st = new SegmentTree(new List<Integer>{1, 3, 5, 7, 9, 11});
        System.debug(st.query(0, 0, 5, 1, 3));
        System.debug(st.query(0, 0, 5, 0, 5));
    }
}
