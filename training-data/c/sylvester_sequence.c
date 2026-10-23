#include <stdio.h>

/* Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
   unsigned long long holds the first 7 terms; s(7) overflows 64 bits. */
int main(void) {
    unsigned long long s = 2;
    for (int i = 0; i < 7; i++) {
        printf("s(%d) = %llu\n", i, s);
        s = s * s - s + 1;
    }
    return 0;
}
