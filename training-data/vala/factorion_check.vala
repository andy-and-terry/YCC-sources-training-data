const int[] FACT = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };

bool is_factorion (int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) {
        sum += FACT[m % 10];
    }
    return sum == n;
}

void main () {
    for (int n = 1; n < 50000; n++) {
        if (is_factorion (n)) {
            print ("%d ", n);
        }
    }
    print ("\n");
}
