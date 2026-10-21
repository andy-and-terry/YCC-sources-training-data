#include <stdio.h>

int is_pronic(int n) {
    for (int k = 0; k * (k + 1) <= n; k++)
        if (k * (k + 1) == n) return 1;
    return 0;
}

int main(void) {
    for (int n = 0; n < 100; n++)
        if (is_pronic(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
