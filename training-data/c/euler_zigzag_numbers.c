#include <stdio.h>

/* Euler zigzag numbers via the Seidel-Entringer boustrophedon. */
int main(void) {
    long row[16] = {1}, next[16];
    int len = 1;
    printf("1 ");
    for (int i = 0; i < 9; i++) {
        next[0] = 0;
        for (int j = len - 1, t = 1; j >= 0; j--, t++) next[t] = next[t - 1] + row[j];
        len++;
        for (int j = 0; j < len; j++) row[j] = next[j];
        printf("%ld ", row[len - 1]);
    }
    printf("\n");
    return 0;
}
