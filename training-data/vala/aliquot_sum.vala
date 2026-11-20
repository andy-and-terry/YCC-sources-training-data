// Aliquot sum classification.
void main () {
    int[] values = { 6, 12, 15, 28 };
    foreach (int n in values) {
        int a = 0;
        for (int d = 1; d < n; d++) if (n % d == 0) a += d;
        string kind = a == n ? "perfect" : (a > n ? "abundant" : "deficient");
        print ("%d %d %s\n", n, a, kind);
    }
}
