int sigma (int n) {
    int s = 0;
    for (int d = 1; d <= n; d++) if (n % d == 0) s += d;
    return s;
}

void main () {
    for (int n = 1; n < 100; n++) if (sigma (sigma (n)) == 2 * n) print ("%d ", n);
    print ("\n"); // 2 4 16 64
}
