// n(n+1)(n+2)(n+3)/24
int term(int n) {
    return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;
}

void main() {
    for (int n = 1; n <= 15; n++) {
        print("%2d -> %d\n", n, term(n));
    }
}
