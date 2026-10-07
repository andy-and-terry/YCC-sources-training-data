#include <limits.h>
#include <stdbool.h>
#include <stdio.h>

bool add_overflows(int a, int b) {
    if (b > 0 && a > INT_MAX - b) return true;
    if (b < 0 && a < INT_MIN - b) return true;
    return false;
}

bool mul_overflows(int a, int b) {
    int result;
    return __builtin_mul_overflow(a, b, &result);
}

int main(void) {
    printf("INT_MAX + 1 overflows? %s\n", add_overflows(INT_MAX, 1) ? "yes" : "no");
    printf("100 + 200 overflows? %s\n", add_overflows(100, 200) ? "yes" : "no");
    printf("65536 * 65536 overflows? %s\n", mul_overflows(65536, 65536) ? "yes" : "no");

    unsigned int u = UINT_MAX;
    u += 1;   /* unsigned wraparound is well defined */
    printf("UINT_MAX + 1 wraps to %u\n", u);
    return 0;
}
