#include <stdio.h>

/* Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3) */
int main(void) {
    unsigned long a = 0, b = 0, c = 1;

    printf("Tribonacci:");
    for (int i = 0; i < 15; i++) {
        printf(" %lu", a);
        unsigned long next = a + b + c;
        a = b;
        b = c;
        c = next;
    }
    printf("\n");
    return 0;
}
