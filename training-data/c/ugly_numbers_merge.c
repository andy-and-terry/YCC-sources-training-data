#include <stdio.h>

static long min3(long a, long b, long c) { long m = a < b ? a : b; return m < c ? m : c; }

int main(void) {
    long seq[12] = {1};
    int i2 = 0, i3 = 0, i5 = 0;
    for (int k = 1; k < 12; k++) {
        long c2 = seq[i2] * 2, c3 = seq[i3] * 3, c5 = seq[i5] * 5;
        long next = min3(c2, c3, c5);
        seq[k] = next;
        if (next == c2) i2++;
        if (next == c3) i3++;
        if (next == c5) i5++;
    }
    for (int k = 0; k < 12; k++) printf("%ld ", seq[k]);
    putchar('\n');
    return 0;
}
