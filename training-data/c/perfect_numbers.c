#include <stdio.h>

unsigned long aliquot_sum(unsigned long n) {
    if (n == 1) return 0;
    unsigned long sum = 1;
    for (unsigned long i = 2; i * i <= n; i++)
        if (n % i == 0) sum += i + (i != n / i ? n / i : 0);
    return sum;
}

const char *classify(unsigned long n) {
    unsigned long s = aliquot_sum(n);
    return s == n ? "perfect" : s > n ? "abundant" : "deficient";
}

int main(void) {
    unsigned long ns[] = {6, 12, 28, 13, 8128};
    for (int i = 0; i < 5; i++) printf("%lu %s\n", ns[i], classify(ns[i]));
    return 0;
}
