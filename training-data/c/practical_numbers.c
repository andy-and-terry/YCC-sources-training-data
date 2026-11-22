#include <stdio.h>

/* Practical numbers: every m in 1..n is a sum of distinct divisors of n. */
static int is_practical(int n) {
    unsigned long long reach = 1ULL; /* bit i set <=> i is a subset sum */
    for (int d = 1; d <= n; d++)
        if (n % d == 0) reach |= reach << d;
    unsigned long long mask = (1ULL << (n + 1)) - 1;
    return (reach & mask) == mask;
}

int main(void) {
    for (int n = 1; n <= 40; n++)
        if (is_practical(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
