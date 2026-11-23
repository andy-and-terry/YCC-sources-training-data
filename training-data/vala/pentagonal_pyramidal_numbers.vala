// n^2(n+1)/2
int term(int n) {
    return ((n * n) * (n + 1)) / 2;
}

void main() {
    for (int n = 1; n <= 15; n++) {
        print("%2d -> %d\n", n, term(n));
    }
}
