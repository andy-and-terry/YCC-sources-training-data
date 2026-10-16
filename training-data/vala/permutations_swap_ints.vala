void permute (int[] a, int k, ref int count) {
    if (k == a.length) {
        foreach (var x in a) {
            stdout.printf ("%d", x);
        }
        stdout.printf ("\n");
        count++;
        return;
    }
    for (int i = k; i < a.length; i++) {
        int t = a[k]; a[k] = a[i]; a[i] = t;
        permute (a, k + 1, ref count);
        t = a[k]; a[k] = a[i]; a[i] = t;
    }
}

void main () {
    int[] digits = { 1, 2, 3 };
    int count = 0;
    permute (digits, 0, ref count);
    stdout.printf ("total: %d\n", count);
}
