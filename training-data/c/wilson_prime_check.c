#include <stdio.h>
/* Wilson's theorem primality test. */
static int wilson(int n) {
    if (n < 2) return 0;
    long f = 1;
    for (int i = 2; i < n; i++) f = f * i % n;
    return f == n - 1;
}
int main(void) {
    for (int n = 2; n < 20; n++) if (wilson(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
