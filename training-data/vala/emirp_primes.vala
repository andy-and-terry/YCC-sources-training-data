bool is_prime (int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

int rev (int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

void main () {
    for (int p = 2; p < 100; p++) {
        if (is_prime (p) && rev (p) != p && is_prime (rev (p))) print ("%d ", p);
    }
    print ("\n");
}
