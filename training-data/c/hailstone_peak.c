/* Highest value reached by the Collatz (hailstone) sequence from n. */
#include <stdio.h>

static unsigned long peak(unsigned long n) {
    unsigned long best = n;
    while (n != 1) {
        n = n % 2 == 0 ? n / 2 : 3 * n + 1;
        if (n > best) best = n;
    }
    return best;
}

int main(void) {
    printf("%lu\n", peak(27));
    return 0;
}
