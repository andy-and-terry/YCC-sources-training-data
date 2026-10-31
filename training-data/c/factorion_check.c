#include <stdio.h>


static const int FACT[10] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

int is_factorion(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) sum += FACT[m % 10];
    return sum == n;
}

int main(void) {
    for (int n = 1; n < 50000; n++)
        if (is_factorion(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
