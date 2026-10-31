#include <stdio.h>


int is_sphenic(int n) {
    int distinct = 0;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return 0;
            distinct++;
        }
    }
    return distinct + (n > 1) == 3;
}

int main(void) {
    for (int n = 2; n < 80; n++)
        if (is_sphenic(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
