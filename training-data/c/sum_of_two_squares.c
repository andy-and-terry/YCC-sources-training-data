#include <stdio.h>

/* Positive n expressible as a*a + b*b with a, b >= 0. */
static int representable(int n) {
    for (int a = 0; a * a <= n; a++)
        for (int b = a; a * a + b * b <= n; b++)
            if (a * a + b * b == n) return 1;
    return 0;
}

int main(void) {
    for (int n = 1; n <= 30; n++)
        if (representable(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
