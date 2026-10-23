#include <stdio.h>

static int is_prime(int n) {
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return n > 1;
}

static int lucas_lehmer(int p) {
    if (p == 2) return 1;
    unsigned long long m = (1ULL << p) - 1;
    unsigned long long s = 4;
    for (int i = 0; i < p - 2; i++) s = (s * s + m - 2) % m;
    return s == 0;
}

int main(void) {
    int first = 1;
    for (int p = 2; p <= 19; p++) {
        if (is_prime(p) && lucas_lehmer(p)) {
            printf("%s%d", first ? "" : " ", p);
            first = 0;
        }
    }
    printf("\n");
    return 0;
}
