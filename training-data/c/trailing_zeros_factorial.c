#include <stdio.h>

/* Zeros at the end of n! equal the number of factors of 5. */
static long trailing_zeros(long n) {
    long z = 0;
    for (long p = 5; p <= n; p *= 5) z += n / p;
    return z;
}

int main(void) {
    long t[] = {5, 10, 25, 100, 1000};
    for (int i = 0; i < 5; i++)
        printf("%ld! ends with %ld zeros\n", t[i], trailing_zeros(t[i]));
    return 0;
}
