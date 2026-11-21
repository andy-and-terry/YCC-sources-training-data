// Cantor pairing function and its inverse.
long pair (long x, long y) {
    return (x + y) * (x + y + 1) / 2 + y;
}

void unpair (long z, out long x, out long y) {
    long w = (long) ((Math.sqrt (8.0 * z + 1) - 1) / 2);
    y = z - w * (w + 1) / 2;
    x = w - y;
}

void main () {
    print ("%ld\n", pair (3, 4));
    long x, y;
    unpair (32, out x, out y);
    print ("%ld %ld\n", x, y);
}
