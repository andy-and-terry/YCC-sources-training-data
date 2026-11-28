bool is_prime (int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

bool is_palindrome (int n) {
    int r = 0;
    for (int m = n; m > 0; m /= 10) {
        r = r * 10 + m % 10;
    }
    return r == n;
}

void main () {
    for (int n = 2; n < 200; n++) {
        if (is_palindrome (n) && is_prime (n)) {
            stdout.printf ("%d ", n);
        }
    }
    stdout.printf ("\n"); // 2 3 5 7 11 101 131 151 181 191
}
