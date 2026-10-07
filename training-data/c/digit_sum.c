#include <stdio.h>
#include <stdlib.h>

int digit_sum(int n) {
    n = abs(n);
    int sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

int digital_root(int n) {
    while (n >= 10) {
        n = digit_sum(n);
    }
    return n;
}

int main(void) {
    printf("digit_sum(12345) = %d\n", digit_sum(12345));
    printf("digital_root(12345) = %d\n", digital_root(12345));
    return 0;
}
