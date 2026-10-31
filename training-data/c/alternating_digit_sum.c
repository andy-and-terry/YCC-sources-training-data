#include <stdio.h>


int alternating_digit_sum(int n) {
    int total = 0, sign = 1;
    while (n > 0) {
        total += sign * (n % 10);
        sign = -sign;
        n /= 10;
    }
    return total;
}

int main(void) {
    int values[] = {1234, 99999, 1000};
    for (int i = 0; i < 3; i++)
        printf("%d %d\n", values[i], alternating_digit_sum(values[i]));
    return 0;
}
