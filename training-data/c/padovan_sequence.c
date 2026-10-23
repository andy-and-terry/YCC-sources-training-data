#include <stdio.h>

/* Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1 */
int main(void) {
    long p[15];
    for (int i = 0; i < 15; i++) {
        p[i] = (i < 3) ? 1 : p[i - 2] + p[i - 3];
        printf("%ld%c", p[i], i < 14 ? ' ' : '\n');
    }
    return 0;
}
