void main () {
    int[] a = { -2, 1, -3, 4, -1, 2, 1, -5, 4 };
    int best = a[0];
    int cur = a[0];
    int start = 0, best_start = 0, best_end = 0;

    for (int i = 1; i < a.length; i++) {
        if (cur < 0) {
            cur = a[i];
            start = i;
        } else {
            cur += a[i];
        }
        if (cur > best) {
            best = cur;
            best_start = start;
            best_end = i;
        }
    }
    stdout.printf ("max sum %d from %d to %d\n", best, best_start, best_end);
}
