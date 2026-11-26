// Palindromic primes below 200; expect 10.
#include <stdio.h>

static int is_prime(int n) {
    if (n < 2) return 0;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return 0;
    return 1;
}

static int is_palindrome(int n) {
    int r = 0, m = n;
    while (m) { r = r * 10 + m % 10; m /= 10; }
    return r == n;
}

int main(void) {
    int c = 0;
    for (int n = 2; n < 200; n++) {
        if (is_palindrome(n) && is_prime(n)) { printf("%d ", n); c++; }
    }
    printf("\n%d\n", c);
    return 0;
}
