#include <stdio.h>

static inline int square(int x) {
    return x * x;
}

static inline int max2(int a, int b) {
    return a > b ? a : b;
}

int main(void) {
    for (int i = 1; i <= 5; i++) {
        printf("%d^2 = %d\n", i, square(i));
    }
    printf("max(7, 12) = %d\n", max2(7, 12));
    return 0;
}
