// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
int gcd (int a, int b) {
    while (b != 0) {
        int t = a % b;
        a = b;
        b = t;
    }
    return a;
}

int phi (int n) {
    int c = 0;
    for (int k = 1; k <= n; k++) {
        if (gcd (k, n) == 1) c++;
    }
    return c;
}

bool is_perfect_totient (int n) {
    int total = 0;
    int m = n;
    while (m > 1) {
        m = phi (m);
        total += m;
    }
    return total == n;
}

void main () {
    for (int n = 2; n < 200; n++) {
        if (is_perfect_totient (n)) print ("%d ", n);
    }
    print ("\n");
}
