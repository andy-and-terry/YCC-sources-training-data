#include <stdio.h>

int main(void) {
    int fact[10] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};
    for (int n = 1; n < 50000; n++) {
        int s = 0;
        for (int m = n; m > 0; m /= 10) s += fact[m % 10];
        if (s == n) printf("%d ", n);
    }
    printf("\n"); /* 1 2 145 40585 */
    return 0;
}
