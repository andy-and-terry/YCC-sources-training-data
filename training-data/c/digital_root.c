#include <stdio.h>

unsigned long long digit_sum(unsigned long long n) {
    unsigned long long s = 0;
    for (; n; n /= 10) s += n % 10;
    return s;
}

unsigned long long digital_root_iter(unsigned long long n) {
    while (n >= 10) n = digit_sum(n);
    return n;
}

unsigned long long digital_root(unsigned long long n) { return n == 0 ? 0 : 1 + (n - 1) % 9; }

int main(void) {
    unsigned long long tests[] = {0, 16, 942, 132189, 493193, 18446744073709551615ull};
    for (int i = 0; i < 6; i++) {
        printf("%llu -> %llu (%s)\n", tests[i], digital_root(tests[i]),
               digital_root(tests[i]) == digital_root_iter(tests[i]) ? "ok" : "MISMATCH");
    }
    return 0;
}
