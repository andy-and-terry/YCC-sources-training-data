bool is_prime (int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

int reverse_number (int n) {
    int r = 0;
    for (; n > 0; n /= 10) {
        r = r * 10 + n % 10;
    }
    return r;
}

void main () {
    for (int p = 2; p < 200; p++) {
        int r = reverse_number (p);
        if (r != p && is_prime (p) && is_prime (r)) {
            stdout.printf ("%d ", p);
        }
    }
    stdout.printf ("\n"); // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
}
