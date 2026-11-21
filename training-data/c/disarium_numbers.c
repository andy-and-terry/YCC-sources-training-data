#include <stdio.h>

/* Disarium numbers: digits raised to their 1-based positions sum to n. */
static int is_disarium(int n) {
    int digits[10], k = 0, sum = 0;
    for (int m = n; m > 0; m /= 10) digits[k++] = m % 10;
    for (int i = 0; i < k; i++) {
        int p = 1;
        for (int e = 0; e <= i; e++) p *= digits[k - 1 - i];
        sum += p;
    }
    return sum == n;
}

int main(void) {
    for (int n = 1; n < 1000; n++)
        if (is_disarium(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
