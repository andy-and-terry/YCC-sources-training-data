// Emirps: primes whose digit reversal is a different prime.
bool is_prime (int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

int reverse_digits (int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

void main () {
    for (int n = 2; n < 100; n++) {
        int r = reverse_digits (n);
        if (r != n && is_prime (n) && is_prime (r)) print ("%d ", n);
    }
    print ("\n");
}
