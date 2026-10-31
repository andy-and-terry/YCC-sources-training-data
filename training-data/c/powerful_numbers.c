#include <stdio.h>


int is_powerful(int n) {
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return 0;
            while (n % p == 0) n /= p;
        }
    }
    return n == 1;
}

int main(void) {
    for (int n = 1; n <= 100; n++)
        if (is_powerful(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
