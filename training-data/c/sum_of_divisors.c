#include <stdio.h>

static int sigma(int n) {
    int s = 0;
    for (int d = 1; d * d <= n; d++) {
        if (n % d == 0) {
            s += d;
            if (d != n / d) s += n / d;
        }
    }
    return s;
}

int main(void) {
    int tests[] = {1, 6, 12, 28, 97, 100};
    for (int i = 0; i < 6; i++)
        printf("sigma(%d) = %d\n", tests[i], sigma(tests[i]));
    return 0;
}
