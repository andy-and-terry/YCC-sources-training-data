// Pernicious numbers: the popcount is prime.
bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

int popcount (int n) {
    int c = 0;
    while (n > 0) {
        c += n & 1;
        n >>= 1;
    }
    return c;
}

void main () {
    for (int n = 1; n <= 20; n++) {
        if (is_prime (popcount (n))) print ("%d ", n);
    }
    print ("\n");
}
