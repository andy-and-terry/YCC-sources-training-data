#include <stdio.h>

/* Hamming numbers (5-smooth), built by merging the x2, x3, x5 streams */
static long min3(long a, long b, long c) {
    long m = a < b ? a : b;
    return m < c ? m : c;
}

int main(void) {
    long h[20] = {1};
    int i2 = 0, i3 = 0, i5 = 0;
    for (int n = 1; n < 20; n++) {
        h[n] = min3(h[i2] * 2, h[i3] * 3, h[i5] * 5);
        if (h[n] == h[i2] * 2) i2++;
        if (h[n] == h[i3] * 3) i3++;
        if (h[n] == h[i5] * 5) i5++;
    }
    for (int n = 0; n < 20; n++) printf("%ld ", h[n]);
    printf("\n");
    return 0;
}
