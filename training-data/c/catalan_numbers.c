#include <stdio.h>

int main(void) {
    enum { N = 30 };
    unsigned long long c[N + 1] = {1};
    for (int i = 1; i <= N; i++) {
        c[i] = 0;
        for (int j = 0; j < i; j++) c[i] += c[j] * c[i - 1 - j];
    }
    /* closed-form check using C(n+1) = C(n) * 2(2n+1) / (n+2) */
    unsigned long long x = 1;
    int ok = 1;
    for (int n = 0; n < N; n++) {
        x = x * 2 * (2 * n + 1) / (n + 2);
        if (x != c[n + 1]) ok = 0;
    }
    for (int i = 0; i <= N; i++) printf("C(%d) = %llu\n", i, c[i]);
    printf("recurrence check: %s\n", ok ? "ok" : "mismatch");
    return 0;
}
