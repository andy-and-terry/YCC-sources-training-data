#include <stdio.h>

static unsigned long long reverse(unsigned long long n) {
    unsigned long long r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

/* Reverse-and-add until a palindrome; count the steps. */
static int steps(unsigned long long n) {
    for (int count = 0; count < 50; count++) {
        if (count > 0 && n == reverse(n)) return count;
        n += reverse(n);
    }
    return -1;
}

int main(void) {
    int starts[] = {56, 57, 59, 79, 89};
    for (int i = 0; i < 5; i++) printf("%d ", steps(starts[i]));
    printf("\n");
    return 0;
}
