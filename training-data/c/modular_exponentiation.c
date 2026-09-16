#include <stdio.h>

long long mod_pow(long long base, long long exp, long long mod) {
    long long result = 1;
    base %= mod;
    while (exp > 0) {
        if (exp & 1) result = (result * base) % mod;
        base = (base * base) % mod;
        exp >>= 1;
    }
    return result;
}

int main(void) {
    printf("%lld\n", mod_pow(2, 10, 1000));
    printf("%lld\n", mod_pow(3, 200, 50));
    return 0;
}
