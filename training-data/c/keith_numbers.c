#include <stdio.h>

/* Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits. */
static int is_keith(int n) {
    int seq[64], k = 0, tmp[16];
    for (int m = n; m > 0; m /= 10) tmp[k++] = m % 10;
    for (int i = 0; i < k; i++) seq[i] = tmp[k - 1 - i];
    int len = k;
    while (seq[len - 1] < n) {
        int sum = 0;
        for (int i = len - k; i < len; i++) sum += seq[i];
        seq[len++] = sum;
    }
    return seq[len - 1] == n;
}

int main(void) {
    for (int n = 10; n < 1200; n++)
        if (is_keith(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
