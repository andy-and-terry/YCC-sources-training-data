#include <stdio.h>

long long power(int base, int exp) {
    long long result = 1;
    for (int i = 0; i < exp; i++) result *= base;
    return result;
}

int main(void) {
    printf("%lld\n", power(2, 10));
    printf("%lld\n", power(3, 5));
    return 0;
}
