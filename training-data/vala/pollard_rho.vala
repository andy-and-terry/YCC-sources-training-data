uint64 gcd (uint64 a, uint64 b) {
    while (b != 0) { uint64 t = a % b; a = b; b = t; }
    return a;
}

uint64 rho (uint64 n) {
    if (n % 2 == 0) return 2;
    uint64 x = 2, y = 2, d = 1;
    while (d == 1) {
        x = (x * x + 1) % n;
        y = (y * y + 1) % n;
        y = (y * y + 1) % n;
        d = gcd (x > y ? x - y : y - x, n);
    }
    return d;
}

void main () {
    uint64 n = 8051, p = rho (n);
    print ("%llu = %llu * %llu\n", n, p, n / p);
}
