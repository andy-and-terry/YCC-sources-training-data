// Wilson's theorem primality test.
bool wilson (int64 n) {
    if (n < 2) return false;
    int64 f = 1;
    for (int64 i = 2; i < n; i++) f = f * i % n;
    return f == n - 1;
}

void main () {
    for (int n = 2; n < 20; n++) if (wilson (n)) print ("%d ", n);
    print ("\n");
}
