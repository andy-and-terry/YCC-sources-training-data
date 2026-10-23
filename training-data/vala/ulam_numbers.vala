void main() {
    int[] u = new int[15];
    u[0] = 1;
    u[1] = 2;
    int len = 2;
    int candidate = 3;
    while (len < 15) {
        int ways = 0;
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                if (u[i] + u[j] == candidate) {
                    ways++;
                }
            }
        }
        if (ways == 1) {
            u[len] = candidate;
            len++;
        }
        candidate++;
    }
    stdout.printf("%d", u[0]);
    for (int k = 1; k < 15; k++) {
        stdout.printf(" %d", u[k]);
    }
    stdout.printf("\n");
}
