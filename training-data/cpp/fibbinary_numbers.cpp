#include <cstdio>

/* Fibbinary numbers: no two adjacent 1 bits. */
int main(void) {
    for (unsigned n = 0; n < 50; n++)
        if ((n & (n >> 1)) == 0) printf("%u ", n);
    printf("\n");
    return 0;
}
