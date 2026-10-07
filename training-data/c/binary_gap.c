#include <stdio.h>

int binary_gap(unsigned n) {
    int best = 0, last = -1;
    for (int i = 0; n; i++, n >>= 1) {
        if (n & 1u) {
            if (last >= 0 && i - last - 1 > best) best = i - last - 1;
            last = i;
        }
    }
    return best;
}

int main(void) {
    unsigned ns[] = {9, 529, 20, 15, 1041};
    for (int i = 0; i < 5; i++) printf("%u %d\n", ns[i], binary_gap(ns[i]));
    return 0;
}
