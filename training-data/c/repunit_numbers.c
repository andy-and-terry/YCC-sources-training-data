/* Repunits: numbers made only of the digit 1. */
#include <stdio.h>

int main(void) {
    unsigned long r = 0;
    for (int i = 0; i < 5; i++) {
        r = r * 10 + 1;
        printf("%lu\n", r);
    }
    return 0;
}
