#include <stdio.h>

/* Sieve of divisor sums for all n <= limit. */
static void divisor_sums(unsigned *sum, unsigned limit) {
    for (unsigned i = 0; i <= limit; i++) sum[i] = 0;
    for (unsigned d = 1; d <= limit / 2; d++)
        for (unsigned m = 2 * d; m <= limit; m += d) sum[m] += d;
}

int main(void) {
    enum { LIMIT = 100000 };
    static unsigned s[LIMIT + 1];
    divisor_sums(s, LIMIT);
    unsigned perfect = 0, abundant = 0, deficient = 0;
    printf("perfect:");
    for (unsigned n = 2; n <= LIMIT; n++) {
        if (s[n] == n) {
            perfect++;
            printf(" %u", n);
        } else if (s[n] > n) abundant++;
        else deficient++;
    }
    printf("\nabundant=%u deficient=%u\n", abundant, deficient);
    printf("amicable pairs:");
    for (unsigned a = 2; a <= LIMIT; a++) {
        unsigned b = s[a];
        if (b > a && b <= LIMIT && s[b] == a) printf(" (%u,%u)", a, b);
    }
    printf("\n");
    return 0;
}
