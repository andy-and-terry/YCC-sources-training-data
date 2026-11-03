#include <stdio.h>
#include <stdlib.h>

static int digit_square_sum(int n) {
    n = abs(n);
    int sum = 0;
    while (n > 0) {
        int d = n % 10;
        sum += d * d;
        n /= 10;
    }
    return sum;
}

int main(void) {
    printf("%d\n", digit_square_sum(123));
    printf("%d\n", digit_square_sum(-99));
    return 0;
}
