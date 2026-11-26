// Emirps below 200; expect 15.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}
static int rev(int n) {
    int r = 0;
    while (n) { r = r * 10 + n % 10; n /= 10; }
    return r;
}

int main(void) {
    int c = 0;
    for (int n = 2; n < 200; n++) if (is_prime(n) && rev(n) != n && is_prime(rev(n))) c++;
    printf("%d\n", c);
    return 0;
}
