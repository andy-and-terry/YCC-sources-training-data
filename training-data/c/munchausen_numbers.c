#include <stdio.h>

/* Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0). */
static int is_munchausen(int n) {
    int sum = 0;
    for (int m = n; m > 0; m /= 10) {
        int d = m % 10, p = d ? 1 : 0;
        for (int i = 0; i < d; i++) p *= d;
        sum += p;
    }
    return sum == n;
}

int main(void) {
    for (int n = 1; n < 5000; n++)
        if (is_munchausen(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
