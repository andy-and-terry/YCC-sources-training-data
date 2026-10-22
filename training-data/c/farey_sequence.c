#include <stdio.h>

/* Print Farey sequence F_n using the next-term recurrence. */
void farey(int n) {
    int a = 0, b = 1, c = 1, d = n;
    printf("%d/%d", a, b);
    while (c <= n) {
        int k = (n + b) / d;
        int na = c, nb = d, nc = k * c - a, nd = k * d - b;
        a = na; b = nb; c = nc; d = nd;
        printf(" %d/%d", a, b);
        if (a == 1 && b == 1) break;
    }
    printf("\n");
}

int main(void) {
    farey(5);
    return 0;
}
