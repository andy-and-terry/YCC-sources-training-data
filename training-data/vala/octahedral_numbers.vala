// n(2n^2+1)/3
int term(int n) {
    return (n * (((2 * n) * n) + 1)) / 3;
}

void main() {
    for (int n = 1; n <= 15; n++) {
        print("%2d -> %d\n", n, term(n));
    }
}
