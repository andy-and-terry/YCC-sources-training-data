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
    for (int p = 2; p < 200; p++) {
        int r = reverse(p);
        if (r != p && is_prime(p) && is_prime(r)) printf("%d ", p);
    }
    printf("\n"); /* 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199 */
    return 0;
}
