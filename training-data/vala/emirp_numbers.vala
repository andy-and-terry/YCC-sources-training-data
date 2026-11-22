// Emirps: primes whose digit reversal is a different prime.
bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

int reverse_num (int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

void main () {
    for (int n = 2; n < 200; n++) {
        int r = reverse_num (n);
        if (r != n && is_prime (n) && is_prime (r)) print ("%d ", n);
    }
    print ("\n");
}
