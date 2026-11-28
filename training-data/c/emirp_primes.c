#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int i = 2; i * i <= n; i++)
        if (n % i == 0) return 0;
    return 1;
}

static int reverse(int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main(void) {
    for (int p = 2; p < 100; p++)
        if (is_prime(p) && reverse(p) != p && is_prime(reverse(p)))
            printf("%d ", p);
    putchar('\n');
    return 0;
}
