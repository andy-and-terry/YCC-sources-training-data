// n(n+1)/2+1
int term(int n) {
    return ((n * (n + 1)) / 2) + 1;
}

void main() {
    for (int n = 1; n <= 15; n++) {
        print("%2d -> %d\n", n, term(n));
    }
}
