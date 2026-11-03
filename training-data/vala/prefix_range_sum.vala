class RangeSum : Object {
    private int[] prefix;

    public RangeSum (int[] values) {
        prefix = new int[values.length + 1];
        for (int i = 0; i < values.length; i++) prefix[i + 1] = prefix[i] + values[i];
    }

    public int query (int lo, int hi) {
        return prefix[hi] - prefix[lo];
    }
}

void main () {
    var rs = new RangeSum ({ 3, 1, 4, 1, 5, 9, 2, 6 });
    print ("%d\n", rs.query (2, 5));
}
