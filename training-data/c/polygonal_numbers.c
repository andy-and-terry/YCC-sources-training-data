#include <stdio.h>

/* n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2 */
int polygonal(int s, int n) {
    return ((s - 2) * n * n - (s - 4) * n) / 2;
}

int main(void) {
    const char *names[] = {"triangular", "pentagonal", "hexagonal"};
    const int sides[] = {3, 5, 6};
    for (int i = 0; i < 3; i++) {
        printf("%s:", names[i]);
        for (int n = 1; n <= 10; n++) printf(" %d", polygonal(sides[i], n));
        printf("\n");
    }
    return 0;
}
