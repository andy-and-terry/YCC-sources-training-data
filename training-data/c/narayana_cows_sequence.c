#include <stdio.h>

/* Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3) */
int main(void) {
    long n[15] = {1, 1, 1};
    for (int i = 3; i < 15; i++) n[i] = n[i - 1] + n[i - 3];
    for (int i = 0; i < 15; i++) printf("%ld ", n[i]);
    printf("\n");
    return 0;
}
