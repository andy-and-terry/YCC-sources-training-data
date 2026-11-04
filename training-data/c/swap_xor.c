#include <stdio.h>

static void swap_xor(int *a, int *b) {
    if (a == b) return; /* XOR swap would zero the value when aliased */
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

int main(void) {
    int x = 12, y = 34;
    swap_xor(&x, &y);
    printf("%d %d\n", x, y);
    swap_xor(&x, &x);
    printf("%d\n", x);
    return 0;
}
