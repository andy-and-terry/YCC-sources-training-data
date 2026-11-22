// Sophie Germain primes: p prime and 2p + 1 prime.
bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

void main () {
    for (int p = 2; p < 100; p++) {
        if (is_prime (p) && is_prime (2 * p + 1)) print ("%d ", p);
    }
    print ("\n");
}
