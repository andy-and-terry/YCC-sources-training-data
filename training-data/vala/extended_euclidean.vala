int extended_gcd(int a, int b, out int x, out int y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    }
    int x1, y1;
    int g = extended_gcd(b, a % b, out x1, out y1);
    x = y1;
    y = x1 - (a / b) * y1;
    return g;
}

void main() {
    int x, y;
    int g = extended_gcd(30, 20, out x, out y);
    stdout.printf("gcd=%d x=%d y=%d\n", g, x, y);

    int x2, y2;
    int g2 = extended_gcd(35, 15, out x2, out y2);
    stdout.printf("gcd=%d x=%d y=%d\n", g2, x2, y2);
    stdout.printf("check=%d\n", 35 * x2 + 15 * y2);
}
