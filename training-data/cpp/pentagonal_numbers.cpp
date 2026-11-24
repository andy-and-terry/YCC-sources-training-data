#include <cstdio>

/* Pentagonal numbers: n(3n-1)/2. */
int main(void) {
    for (int n = 1; n <= 10; n++) printf("%d ", n * (3 * n - 1) / 2);
    printf("\n");
    return 0;
}
