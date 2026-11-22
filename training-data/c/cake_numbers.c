#include <stdio.h>

/* Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6. */
int main(void) {
    for (int n = 0; n < 10; n++) printf("%d ", (n * n * n + 5 * n + 6) / 6);
    printf("\n");
    return 0;
}
