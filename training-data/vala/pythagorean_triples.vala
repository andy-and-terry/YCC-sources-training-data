void main () {
    int limit = 20;
    for (int a = 1; a < limit; a++) {
        for (int b = a; b < limit; b++) {
            int c2 = a * a + b * b;
            int c = (int) Math.sqrt (c2);
            if (c <= limit && c * c == c2) {
                print ("%d^2 + %d^2 = %d^2\n", a, b, c);
            }
        }
    }
}
