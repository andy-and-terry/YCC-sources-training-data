#include <stdio.h>

/* Evil numbers have an even number of 1 bits. */
int main(void) {
    for (int n = 0; n <= 20; n++)
        if (__builtin_parity(n) == 0) printf("%d ", n);
    printf("\n");
    return 0;
}
