class SqrtSum {
    List<Integer> a
    int bs
    List<Integer> blk

    SqrtSum(List<Integer> a, int bs) {
        this.a = a
        this.bs = bs
        this.blk = a.collate(bs)*.sum()
    }

    int query(int l, int r) {
        int s = 0, i = l
        while (i <= r) {
            if (i % bs == 0 && i + bs - 1 <= r) { s += blk[i.intdiv(bs)]; i += bs }
            else { s += a[i]; i++ }
        }
        s
    }
}
println new SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9)
