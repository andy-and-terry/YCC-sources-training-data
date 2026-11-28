#include <stdio.h>

static int digit_square_sum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
    return s;
}

static int is_happy(int n) {
    int slow = n, fast = n;
    do {
        slow = digit_square_sum(slow);
        fast = digit_square_sum(digit_square_sum(fast));
    } while (slow != fast);
    return slow == 1;
}

int main(void) {
    for (int n = 1, c = 0; c < 8; n++)
        if (is_happy(n)) { printf("%d ", n); c++; }
    printf("\n"); /* 1 7 10 13 19 23 28 31 */
    return 0;
}
