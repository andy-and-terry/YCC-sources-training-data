#include <cstdio>

/* Tetrahedral numbers: n(n+1)(n+2)/6. */
int main(void) {
    for (int n = 1; n <= 10; n++) printf("%d ", n * (n + 1) * (n + 2) / 6);
    printf("\n");
    return 0;
}
