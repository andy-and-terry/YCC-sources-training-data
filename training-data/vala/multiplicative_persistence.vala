int persistence (int64 n) {
    int steps = 0;
    while (n >= 10) {
        int64 product = 1;
        for (; n > 0; n /= 10) {
            product *= n % 10;
        }
        n = product;
        steps++;
    }
    return steps;
}

void main () {
    int64[] values = { 39, 77, 999, 10 };
    foreach (int64 n in values) {
        print ("%lld %d\n", n, persistence (n));
    }
}
