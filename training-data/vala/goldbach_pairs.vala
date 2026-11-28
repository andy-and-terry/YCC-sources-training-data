bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

void main () {
    int n = 28;
    for (int p = 2; p <= n / 2; p++) {
        if (is_prime (p) && is_prime (n - p)) print ("%d + %d\n", p, n - p);
    }
}
