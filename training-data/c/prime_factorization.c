#include <stdio.h>

void print_factors(int n) {
    printf("%d = ", n);
    int first = 1;
    for (int d = 2; d * d <= n; d++) {
        while (n % d == 0) {
            printf("%s%d", first ? "" : " x ", d);
            first = 0;
            n /= d;
        }
    }
    if (n > 1) {
        printf("%s%d", first ? "" : " x ", n);
    }
    printf("\n");
}

int main(void) {
    print_factors(360);
    print_factors(97);
    print_factors(1001);
    return 0;
}
