// Sum of prime factors counted with multiplicity.
int sopfr (int n) {
    int total = 0;
    for (int p = 2; p * p <= n; p++) {
        while (n % p == 0) {
            total += p;
            n /= p;
        }
    }
    return total + (n > 1 ? n : 0);
}

void main () {
    for (int n = 2; n < 110; n++) {
        if (sopfr (n) == sopfr (n + 1)) print ("%d ", n);
    }
    print ("\n");
}
