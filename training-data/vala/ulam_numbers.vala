void main() {
    int[] terms = new int[15];
    terms[0] = 1;
    terms[1] = 2;
    int len = 2;
    for (int c = 3; len < 15; c++) {
        int ways = 0;
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                if (terms[i] + terms[j] == c) {
                    ways++;
                }
            }
        }
        if (ways == 1) {
            terms[len++] = c;
        }
    }
    stdout.printf("%d", terms[0]);
    for (int i = 1; i < 15; i++) {
        stdout.printf(" %d", terms[i]);
    }
    stdout.printf("\n");
}
