#include <stdio.h>

static unsigned min3(unsigned a, unsigned b, unsigned c) {
    unsigned m = a < b ? a : b;
    return m < c ? m : c;
}

static unsigned nth_ugly(int n) {
    unsigned u[64] = {1};
    int i2 = 0, i3 = 0, i5 = 0;
    for (int k = 1; k < n; k++) {
        u[k] = min3(u[i2] * 2, u[i3] * 3, u[i5] * 5);
        if (u[k] == u[i2] * 2) i2++;
        if (u[k] == u[i3] * 3) i3++;
        if (u[k] == u[i5] * 5) i5++;
    }
    return u[n - 1];
}

int main(void) {
    for (int k = 1; k <= 15; k++) printf("%u ", nth_ugly(k));
    printf("\n");
    return 0;
}
