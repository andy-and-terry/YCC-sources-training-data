int popcount (uint n) {
    int c = 0;
    while (n > 0) {
        c += (int) (n & 1);
        n >>= 1;
    }
    return c;
}

void main () {
    for (uint n = 0; n < 16; n++) print ("%d ", 1 << popcount (n));
    print ("\n");
}
