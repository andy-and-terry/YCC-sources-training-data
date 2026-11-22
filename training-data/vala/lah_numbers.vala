// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
int64 fact (int n) {
    int64 f = 1;
    for (int i = 2; i <= n; i++) f *= i;
    return f;
}

int64 comb (int n, int k) {
    return fact (n) / (fact (k) * fact (n - k));
}

void main () {
    int n = 5;
    for (int k = 1; k <= n; k++) {
        print ("%s ", (comb (n - 1, k - 1) * fact (n) / fact (k)).to_string ());
    }
    print ("\n");
}
