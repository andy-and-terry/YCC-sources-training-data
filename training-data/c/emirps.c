#include <stdio.h>

static int is_prime(long n) {
    if (n < 2) return 0;
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return 0;
    return 1;
}

static long reverse(long n) {
    long r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    int count = 0;
    for (long n = 2; count < 10; n++) {
        long r = reverse(n);
        if (r != n && is_prime(n) && is_prime(r)) { printf("%ld ", n); count++; }
    }
    printf("\n"); /* 13 17 31 37 71 73 79 97 107 113 */
    return 0;
}
