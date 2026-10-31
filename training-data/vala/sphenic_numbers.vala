bool is_sphenic (int n) {
    int distinct = 0;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) {
                return false;
            }
            distinct++;
        }
    }
    return distinct + (n > 1 ? 1 : 0) == 3;
}

void main () {
    for (int n = 2; n < 80; n++) {
        if (is_sphenic (n)) {
            print ("%d ", n);
        }
    }
    print ("\n");
}
