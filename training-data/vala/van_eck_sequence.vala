void main() {
    int[] t = new int[20];
    t[0] = 0;
    stdout.printf("%d", t[0]);
    for (int i = 0; i < 19; i++) {
        int next = 0;
        for (int j = i - 1; j >= 0; j--) {
            if (t[j] == t[i]) {
                next = i - j;
                break;
            }
        }
        t[i + 1] = next;
        stdout.printf(" %d", next);
    }
    stdout.printf("\n");
}
