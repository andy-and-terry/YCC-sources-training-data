// n(n+1)(2n+1)/6
int term(int n) {
    return ((n * (n + 1)) * ((2 * n) + 1)) / 6;
}

void main() {
    for (int n = 1; n <= 15; n++) {
        print("%2d -> %d\n", n, term(n));
    }
}
