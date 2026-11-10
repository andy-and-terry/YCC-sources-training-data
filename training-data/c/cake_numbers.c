#include <stdio.h>

static int cake(int n) { return (n * n * n + 5 * n + 6) / 6; }

int main(void) {
    for (int n = 0; n < 10; n++) printf("%d ", cake(n));
    printf("\n"); /* 1 2 4 8 15 26 42 64 93 130 */
    return 0;
}
