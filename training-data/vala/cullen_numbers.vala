int64 cullen (int n) {
    return (int64) n * (1 << n) + 1;
}

void main () {
    for (int n = 1; n <= 5; n++) {
        print ("%d %lld\n", n, cullen (n));
    }
}
