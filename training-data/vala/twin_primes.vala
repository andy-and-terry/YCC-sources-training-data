bool is_prime (int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) return false;
    }
    return true;
}

void main () {
    for (int p = 3; p + 2 <= 50; p++) {
        if (is_prime (p) && is_prime (p + 2)) print ("(%d, %d)\n", p, p + 2);
    }
}
