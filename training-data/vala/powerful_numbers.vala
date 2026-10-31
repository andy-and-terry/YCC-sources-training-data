bool is_powerful (int n) {
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) {
                return false;
            }
            while (n % p == 0) {
                n /= p;
            }
        }
    }
    return n == 1;
}

void main () {
    for (int n = 1; n <= 100; n++) {
        if (is_powerful (n)) {
            print ("%d ", n);
        }
    }
    print ("\n");
}
