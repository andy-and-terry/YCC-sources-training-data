#include <stdio.h>

static int proper_divisor_sum(int n) {
    int total = 0;
    for (int d = 1; d < n; d++) {
        if (n % d == 0) total += d;
    }
    return total;
}

int main(void) {
    int value = 12;
    printf("%d ", value);
    while (value != 0) {
        value = proper_divisor_sum(value);
        printf("%d ", value);
    }
    printf("\n");
    return 0;
}
