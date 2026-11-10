bool is_prime (int64 n) {
    if (n < 2) return false;
    for (int64 i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

int64 reverse_digits (int64 n) {
    int64 r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

void main () {
    int count = 0;
    for (int64 n = 2; count < 10; n++) {
        int64 r = reverse_digits (n);
        if (r != n && is_prime (n) && is_prime (r)) {
            print ("%lld ", n);
            count++;
        }
    }
    print ("\n"); // 13 17 31 37 71 73 79 97 107 113
}
