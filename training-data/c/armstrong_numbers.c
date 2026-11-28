#include <stdio.h>

static int ipow(int b, int e) {
    int r = 1;
    while (e-- > 0) r *= b;
    return r;
}

static int is_armstrong(int n) {
    int len = 0, sum = 0;
    for (int m = n; m > 0; m /= 10) len++;
    for (int m = n; m > 0; m /= 10) sum += ipow(m % 10, len);
    return sum == n;
}

int main(void) {
    for (int n = 1; n < 1000; n++)
        if (is_armstrong(n)) printf("%d ", n);
    printf("\n"); /* 1..9 153 370 371 407 */
    return 0;
}
