bool is_prime (int64 n) {
    if (n < 2) return false;
    for (int64 i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

void main () {
    int count = 0;
    for (int64 p = 2; count < 10; p++) {
        if (is_prime (p) && is_prime (2 * p + 1)) {
            print ("%lld ", p);
            count++;
        }
    }
    print ("\n"); // 2 3 5 11 23 29 41 53 83 89
}
