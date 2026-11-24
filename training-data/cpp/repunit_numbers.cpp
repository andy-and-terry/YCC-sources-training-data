#include <cstdio>

/* Repunits: R_n = 11...1 (n ones), built as R_{n-1} * 10 + 1. */
int main(void) {
    long long r = 0;
    for (int n = 1; n <= 8; n++) {
        r = r * 10 + 1;
        printf("%lld%s\n", r, r % 3 == 0 ? "  (divisible by 3)" : "");
    }
    return 0;
}
