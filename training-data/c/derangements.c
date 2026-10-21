#include <stdio.h>

long derangements(int n) {
    long a = 1, b = 0;
    if (n == 0) return a;
    for (int i = 2; i <= n; i++) {
        long next = (i - 1) * (a + b);
        a = b;
        b = next;
    }
    return b;
}

int main(void) {
    for (int i = 0; i < 8; i++) printf("%ld ", derangements(i));
    printf("\n");
    return 0;
}
