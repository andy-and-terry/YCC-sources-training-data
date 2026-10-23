void main() {
    int[] s = new int[32];
    s[0] = 1;
    s[1] = 2;
    s[2] = 2;
    int len = 3;
    int i = 2;
    while (len < 20) {
        int value = 3 - s[len - 1];
        for (int j = 0; j < s[i]; j++) {
            s[len] = value;
            len++;
        }
        i++;
    }
    stdout.printf("%d", s[0]);
    for (int k = 1; k < 20; k++) {
        stdout.printf(" %d", s[k]);
    }
    stdout.printf("\n");
}
