#include <stdio.h>

static int popcount(unsigned n) {
    int c = 0;
    while (n) {
        n &= n - 1;
        c++;
    }
    return c;
}

int main(void) {
    unsigned tests[] = {0, 1, 7, 255, 1024, 0xFFFFFFFFu};
    for (int i = 0; i < 6; i++)
        printf("popcount(%u) = %d\n", tests[i], popcount(tests[i]));
    return 0;
}
