int polygonal(int s, int n) {
    return ((s - 2) * n * n - (s - 4) * n) / 2;
}

void main() {
    string[] names = { "triangular", "pentagonal", "hexagonal" };
    int[] sides = { 3, 5, 6 };
    for (int i = 0; i < names.length; i++) {
        stdout.printf("%s:", names[i]);
        for (int n = 1; n <= 10; n++) {
            stdout.printf(" %d", polygonal(sides[i], n));
        }
        stdout.printf("\n");
    }
}
