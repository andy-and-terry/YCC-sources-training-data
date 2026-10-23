#include <stdio.h>

int is_automorphic(long n) {
    long mod = 1;
    for (long m = n; m > 0; m /= 10) mod *= 10;
    return n * n % mod == n;
}

int main(void) {
    for (long n = 1; n < 1000; n++)
        if (is_automorphic(n)) printf("%ld ", n);
    printf("\n");
    return 0;
}
