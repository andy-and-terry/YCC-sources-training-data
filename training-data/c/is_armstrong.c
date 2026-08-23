#include <stdio.h>

int is_armstrong(int n) {
    int original = n, sum = 0;
    while (n > 0) {
        int digit = n % 10;
        sum += digit * digit * digit;
        n /= 10;
    }
    return sum == original;
}

int main(void) {
    printf("%d\n", is_armstrong(153));
    printf("%d\n", is_armstrong(123));
    return 0;
}
