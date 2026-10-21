#include <stdio.h>

int divisor_sum(int n) {
    int s = 0;
    for (int d = 1; d < n; d++)
        if (n % d == 0) s += d;
    return s;
}

int main(void) {
    for (int n = 1; n < 60; n++)
        if (divisor_sum(n) > n) printf("%d ", n);
    printf("\n");
    return 0;
}
