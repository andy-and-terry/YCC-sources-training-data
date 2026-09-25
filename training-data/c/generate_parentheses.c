#include <stdio.h>

static int count;

static void generate(char *buf, int pos, int open, int close, int n, int print) {
    if (pos == 2 * n) {
        buf[pos] = '\0';
        if (print) printf("%s\n", buf);
        count++;
        return;
    }
    if (open < n) {
        buf[pos] = '(';
        generate(buf, pos + 1, open + 1, close, n, print);
    }
    if (close < open) {
        buf[pos] = ')';
        generate(buf, pos + 1, open, close + 1, n, print);
    }
}

int main(void) {
    char buf[64];
    generate(buf, 0, 0, 0, 3, 1);
    count = 0;
    generate(buf, 0, 0, 0, 10, 0);
    printf("n=10: %d\n", count);
    return 0;
}
