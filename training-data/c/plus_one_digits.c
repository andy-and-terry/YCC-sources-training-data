#include <stdio.h>

/* Increments in place; returns new length (buffer needs one spare slot). */
static int plus_one(int *d, int n) {
    for (int i = n - 1; i >= 0; i--) {
        if (d[i] < 9) { d[i]++; return n; }
        d[i] = 0;
    }
    for (int i = n; i > 0; i--) d[i] = d[i - 1];
    d[0] = 1;
    return n + 1;
}

int main(void) {
    int d[4] = {9, 9};
    int n = plus_one(d, 2);
    for (int i = 0; i < n; i++) printf("%d", d[i]);
    printf("\n"); /* 100 */
    return 0;
}
