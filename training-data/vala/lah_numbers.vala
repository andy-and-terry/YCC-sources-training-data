int64 lah (int n, int k) {
    int64 c = 1, f = 1;
    for (int i = 0; i < k - 1; i++) c = c * (n - 1 - i) / (i + 1);
    for (int i = k + 1; i <= n; i++) f *= i;
    return c * f;
}

void main () {
    for (int n = 1; n <= 5; n++) {
        for (int k = 1; k <= n; k++) print ("%lld ", lah (n, k));
        print ("\n");
    }
}
