#include <cstdio>

/* Hexagonal numbers: n(2n-1). */
int main(void) {
    for (int n = 1; n <= 10; n++) printf("%d ", n * (2 * n - 1));
    printf("\n");
    return 0;
}
