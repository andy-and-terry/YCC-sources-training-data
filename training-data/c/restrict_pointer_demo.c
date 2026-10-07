#include <stdio.h>

/* 'restrict' promises the compiler the pointers do not alias,
   enabling more aggressive optimization (e.g. vectorization). */
static void add_arrays(int n, int *restrict out,
                       const int *restrict a, const int *restrict b) {
    for (int i = 0; i < n; i++) out[i] = a[i] + b[i];
}

int main(void) {
    int a[] = {1, 2, 3, 4}, b[] = {10, 20, 30, 40}, out[4];
    add_arrays(4, out, a, b);
    for (int i = 0; i < 4; i++) printf("%d ", out[i]);
    printf("\n");
    return 0;
}
