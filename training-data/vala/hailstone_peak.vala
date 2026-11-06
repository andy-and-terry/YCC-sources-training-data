// Highest value reached by the Collatz (hailstone) sequence from n.
int64 peak (int64 n) {
    int64 best = n;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        if (n > best) best = n;
    }
    return best;
}

void main () {
    print ("%lld\n", peak (27));
}
