// Population count (number of set bits) for 0..15
int bits (uint n) {
    int c = 0;
    while (n > 0) {
        c += (int) (n & 1);
        n >>= 1;
    }
    return c;
}

void main () {
    for (uint n = 0; n < 16; n++) {
        stdout.printf ("%d ", bits (n));
    }
    stdout.printf ("\n");
}
