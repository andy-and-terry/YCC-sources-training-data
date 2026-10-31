#include <stdio.h>


long cube_from_odds(long n) {
    long start = n * n - n + 1, sum = 0;
    for (long i = 0; i < n; i++) sum += start + 2 * i;
    return sum;
}

int main(void) {
    for (long n = 1; n <= 5; n++)
        printf("%ld %ld %d\n", n, cube_from_odds(n), cube_from_odds(n) == n * n * n);
    return 0;
}
