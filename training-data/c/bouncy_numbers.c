#include <stdio.h>

/* Count bouncy numbers (neither increasing nor decreasing digits) below 1000. */
static int is_bouncy(int n) {
    int inc = 1, dec = 1, prev = n % 10;
    for (int m = n / 10; m > 0; m /= 10) {
        int d = m % 10;
        if (d > prev) inc = 0;
        if (d < prev) dec = 0;
        prev = d;
    }
    return !inc && !dec;
}

int main(void) {
    int count = 0;
    for (int n = 1; n < 1000; n++)
        if (is_bouncy(n)) count++;
    printf("%d\n", count);
    return 0;
}
