#include <stdio.h>

/* Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1. */
int main(void) {
    for (int n = 0; n < 10; n++) printf("%d ", n * (n + 1) / 2 + 1);
    printf("\n");
    return 0;
}
