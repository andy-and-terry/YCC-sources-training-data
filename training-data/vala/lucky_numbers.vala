void main() {
    int[] l = new int[50];
    for (int i = 0; i < 50; i++) {
        l[i] = 2 * i + 1;
    }
    int len = 50;
    int idx = 1;
    while (idx < len && l[idx] <= len) {
        int step = l[idx];
        int kept = 0;
        for (int k = 0; k < len; k++) {
            if ((k + 1) % step != 0) {
                l[kept] = l[k];
                kept++;
            }
        }
        len = kept;
        idx++;
    }
    stdout.printf("%d", l[0]);
    for (int k = 1; k < len; k++) {
        stdout.printf(" %d", l[k]);
    }
    stdout.printf("\n");
}
