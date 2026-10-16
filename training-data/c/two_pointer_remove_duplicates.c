#include <stdio.h>

/* Remove duplicates from a sorted array in place; returns new length. */
static int dedupe(int *a, int n) {
    if (n == 0) return 0;
    int w = 1;
    for (int r = 1; r < n; r++)
        if (a[r] != a[w - 1]) a[w++] = a[r];
    return w;
}

int main(void) {
    int a[] = {1, 1, 2, 2, 2, 3, 5, 5, 8};
    int n = dedupe(a, 9);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("(len %d)\n", n);
    return 0;
}
