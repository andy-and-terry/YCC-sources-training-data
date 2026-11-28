bool is_prime (int64 n) {
    if (n < 2) return false;
    for (int64 i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

void main () {
    int found = 0;
    for (int64 y = 1; found < 8; y++) {
        int64 p = 3 * y * y + 3 * y + 1;
        if (is_prime (p)) {
            print ("%lld ", p);
            found++;
        }
    }
    print ("\n");
}
