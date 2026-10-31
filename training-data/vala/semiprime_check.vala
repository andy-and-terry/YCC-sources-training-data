int prime_factor_count (int n) {
    int count = 0;
    for (int p = 2; p * p <= n; p++) {
        while (n % p == 0) {
            n /= p;
            count++;
        }
    }
    return n > 1 ? count + 1 : count;
}

void main () {
    for (int n = 2; n < 30; n++) {
        if (prime_factor_count (n) == 2) {
            print ("%d ", n);
        }
    }
    print ("\n");
}
