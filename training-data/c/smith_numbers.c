#include <stdio.h>

static int digit_sum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += n % 10;
    return s;
}

static int factor_digit_sum(int n) {
    int total = 0;
    for (int d = 2; n > 1; d++) {
        while (n % d == 0) {
            total += digit_sum(d);
            n /= d;
        }
    }
    return total;
}

static int is_prime(int n) {
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return 0;
    return n > 1;
}

int main(void) {
    int first = 1;
    for (int n = 2; n < 100; n++) {
        if (!is_prime(n) && digit_sum(n) == factor_digit_sum(n)) {
            printf("%s%d", first ? "" : " ", n);
            first = 0;
        }
    }
    printf("\n");
    return 0;
}
