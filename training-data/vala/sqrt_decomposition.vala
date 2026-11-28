void main () {
    int[] a = { 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5 };
    int bs = 4;
    int[] blk = new int[3];
    for (int i = 0; i < a.length; i++) blk[i / bs] += a[i];
    int l = 2, r = 9, sum = 0, i = l;
    while (i <= r) {
        if (i % bs == 0 && i + bs - 1 <= r) { sum += blk[i / bs]; i += bs; }
        else { sum += a[i]; i++; }
    }
    print ("%d\n", sum);
}
