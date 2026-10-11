#include <stdio.h>
#include <stdlib.h>

int main(void) {
    size_t n = 4;
    int *a = calloc(n, sizeof *a);           /* zero-initialised */
    if (!a) return 1;
    for (size_t i = 0; i < n; i++) printf("%d ", a[i]);
    putchar('\n');

    int *b = realloc(a, 8 * sizeof *a);      /* grow; new bytes are indeterminate */
    if (!b) { free(a); return 1; }
    a = b;
    for (size_t i = 0; i < 8; i++) a[i] = (int)(i * i);
    for (size_t i = 0; i < 8; i++) printf("%d ", a[i]);
    putchar('\n');
    free(a);
    return 0;
}
