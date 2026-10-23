/* Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2) */
#include <stdio.h>

int main(void) {
    long a = 0, b = 1;
    for (int i = 0; i < 15; i++) {
        printf("%ld%c", a, i < 14 ? ' ' : '\n');
        long next = b + 2 * a;
        a = b;
        b = next;
    }
    return 0;
}
