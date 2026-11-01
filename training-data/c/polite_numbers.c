#include <stdio.h>

/* Ways to write n as a sum of two or more consecutive positive integers. */
static int polite_ways(int n) {
    int ways = 0;
    for (int k = 2; k * (k + 1) / 2 <= n; k++)
        if ((n - k * (k - 1) / 2) % k == 0) ways++;
    return ways;
}

int main(void) {
    for (int n = 1; n <= 16; n++) printf("%d ", polite_ways(n));
    printf("\n");
    return 0;
}
