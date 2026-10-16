int binary_gap (uint n) {
    int best = 0;
    int current = 0;
    bool seen_one = false;
    while (n > 0) {
        if ((n & 1) == 1) {
            if (seen_one && current > best) {
                best = current;
            }
            seen_one = true;
            current = 0;
        } else if (seen_one) {
            current++;
        }
        n >>= 1;
    }
    return best;
}

void main () {
    uint[] tests = { 9, 529, 20, 15, 1041 };
    foreach (var t in tests) {
        stdout.printf ("%u -> %d\n", t, binary_gap (t));
    }
}
