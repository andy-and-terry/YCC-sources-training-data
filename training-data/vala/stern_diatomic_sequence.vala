void main() {
    int[] s = new int[20];
    s[1] = 1;
    for (int n = 2; n < 20; n++) {
        if (n % 2 == 0) {
            s[n] = s[n / 2];
        } else {
            s[n] = s[n / 2] + s[n / 2 + 1];
        }
    }
    stdout.printf("%d", s[0]);
    for (int k = 1; k < 20; k++) {
        stdout.printf(" %d", s[k]);
    }
    stdout.printf("\n");
}
