void main() {
    int[] a = new int[24];
    a[0] = 1;
    a[1] = 2;
    a[2] = 2;
    int w = 3;
    int v = 1;
    for (int r = 2; w < 20; r++) {
        for (int k = 0; k < a[r]; k++) {
            a[w++] = v;
        }
        v = 3 - v;
    }
    stdout.printf("%d", a[0]);
    for (int i = 1; i < 20; i++) {
        stdout.printf(" %d", a[i]);
    }
    stdout.printf("\n");
}
