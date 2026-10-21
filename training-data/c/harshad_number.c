#include <stdio.h>

int is_harshad(int n) {
    int s = 0;
    for (int m = n; m > 0; m /= 10) s += m % 10;
    return n > 0 && n % s == 0;
}

int main(void) {
    for (int n = 1; n < 50; n++)
        if (is_harshad(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
