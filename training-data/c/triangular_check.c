#include <stdio.h>
#include <math.h>

/* n is triangular iff 8n + 1 is a perfect square. */
static int is_triangular(int n) {
    int s = 8 * n + 1;
    int r = (int)(sqrt((double)s) + 0.5);
    return r * r == s;
}

int main(void) {
    for (int n = 0; n <= 20; n++)
        if (is_triangular(n)) printf("%d ", n);
    printf("\n");
    return 0;
}
