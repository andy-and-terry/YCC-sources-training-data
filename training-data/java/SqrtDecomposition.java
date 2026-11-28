public class SqrtDecomposition {
    private final int[] a, blk;
    private final int bs;

    SqrtDecomposition(int[] a, int bs) {
        this.a = a;
        this.bs = bs;
        this.blk = new int[(a.length + bs - 1) / bs];
        for (int i = 0; i < a.length; i++) blk[i / bs] += a[i];
    }

    int query(int l, int r) {
        int s = 0;
        for (int i = l; i <= r; ) {
            if (i % bs == 0 && i + bs - 1 <= r) { s += blk[i / bs]; i += bs; }
            else s += a[i++];
        }
        return s;
    }

    public static void main(String[] args) {
        var t = new SqrtDecomposition(new int[]{5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5}, 4);
        System.out.println(t.query(2, 9));
    }
}
