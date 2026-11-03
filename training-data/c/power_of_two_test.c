#include <stdio.h>

static int is_power_of_two(unsigned n) { return n && !(n & (n - 1)); }

int main(void) {
    for (unsigned n = 1; n < 40; n++)
        if (is_power_of_two(n)) printf("%u ", n);
    printf("\n");
    return 0;
}
