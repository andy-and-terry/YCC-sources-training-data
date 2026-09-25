#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    enum { LIMIT = 1000000 };
    uint16_t *steps = calloc(LIMIT, sizeof *steps);
    if (!steps) return 1;
    unsigned best = 1;
    for (unsigned i = 2; i < LIMIT; i++) {
        uint64_t n = i;
        unsigned count = 0;
        while (n >= i) {
            n = (n & 1) ? 3 * n + 1 : n / 2;
            count++;
        }
        steps[i] = (uint16_t)(count + steps[n]);
        if (steps[i] > steps[best]) best = i;
    }
    printf("27:");
    for (uint64_t n = 27; ; n = (n & 1) ? 3 * n + 1 : n / 2) {
        printf(" %llu", (unsigned long long)n);
        if (n == 1) break;
    }
    printf("\nlongest chain under %d starts at %u (%u steps)\n", LIMIT, best, steps[best]);
    free(steps);
    return 0;
}
