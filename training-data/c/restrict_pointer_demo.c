#include <stdio.h>

/* `restrict` promises the compiler that dest and src never overlap,
 * which can let it vectorize the loop more aggressively than a plain
 * memcpy-style function with unqualified pointers could. */
void add_arrays(int *restrict dest, const int *restrict a, const int *restrict b, int n) {
    for (int i = 0; i < n; i++) {
        dest[i] = a[i] + b[i];
    }
}

int main(void) {
    int a[] = {1, 2, 3, 4};
    int b[] = {10, 20, 30, 40};
    int result[4];

    add_arrays(result, a, b, 4);
    for (int i = 0; i < 4; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");
    return 0;
}
