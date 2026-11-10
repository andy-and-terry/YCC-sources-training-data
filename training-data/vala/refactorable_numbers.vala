int tau (int n) {
    int c = 0;
    for (int d = 1; d <= n; d++) if (n % d == 0) c++;
    return c;
}

void main () {
    for (int n = 1; n < 60; n++) if (n % tau (n) == 0) print ("%d ", n);
    print ("\n"); // 1 2 8 9 12 18 24 36 40 56
}
