#include <stdio.h>

/* P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1 */
int main(void) {
    unsigned long a = 0, b = 1;
    for (int i = 0; i < 15; i++) {
        printf("P(%d) = %lu\n", i, a);
        unsigned long next = 2 * b + a;
        a = b;
        b = next;
    }
    return 0;
}
