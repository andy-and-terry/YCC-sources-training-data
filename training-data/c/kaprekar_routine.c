#include <stdio.h>
#include <stdlib.h>

static int cmp(const void *a, const void *b) { return *(const int *)a - *(const int *)b; }

int kaprekar_steps(int n) {
    int steps = 0;
    while (n != 6174) {
        int d[4] = {n / 1000 % 10, n / 100 % 10, n / 10 % 10, n % 10};
        qsort(d, 4, sizeof d[0], cmp);
        int asc = d[0] * 1000 + d[1] * 100 + d[2] * 10 + d[3];
        int desc = d[3] * 1000 + d[2] * 100 + d[1] * 10 + d[0];
        n = desc - asc;
        steps++;
    }
    return steps;
}

int main(void) {
    printf("%d\n", kaprekar_steps(3524));
    return 0;
}
