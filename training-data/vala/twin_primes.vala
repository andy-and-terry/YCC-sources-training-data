// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

void main () {
    for (int p = 2; p < 100; p++) {
        if (is_prime (p) && is_prime (p + 2)) print ("%d ", p);
    }
    print ("\n");
}
