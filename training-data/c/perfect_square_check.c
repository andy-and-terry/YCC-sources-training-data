#include <math.h>
#include <stdio.h>

static int is_perfect_square(long n) {
    if (n < 0) return 0;
    long r = (long)sqrt((double)n);
    return r * r == n;
}

int main(void) {
    for (long n = 0; n < 30; n++)
        if (is_perfect_square(n)) printf("%ld ", n);
    printf("\n");
    return 0;
}
