#include <math.h>
#include <stdio.h>

static int is_pronic(long x) {
    long n = (long)sqrt((double)x);
    return n * (n + 1) == x;
}

int main(void) {
    for (int n = 0; n < 10; n++) printf("%d ", n * (n + 1));
    printf("\n"); /* 0 2 6 12 20 30 42 56 72 90 */
    printf("%d %d\n", is_pronic(56), is_pronic(57)); /* 1 0 */
    return 0;
}
