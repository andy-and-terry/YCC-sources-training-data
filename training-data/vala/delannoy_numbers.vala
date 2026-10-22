void main() {
    int[,] d = new int[10, 10];
    for (int m = 0; m < 10; m++) {
        for (int n = 0; n < 10; n++) {
            if (m == 0 || n == 0) {
                d[m, n] = 1;
            } else {
                d[m, n] = d[m - 1, n] + d[m, n - 1] + d[m - 1, n - 1];
            }
        }
    }
    stdout.printf("%d", d[0, 0]);
    for (int k = 1; k < 10; k++) {
        stdout.printf(" %d", d[k, k]);
    }
    stdout.printf("\n");
}
