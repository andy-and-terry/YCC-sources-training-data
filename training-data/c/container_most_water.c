#include <stdio.h>

static int max_area(const int *h, int n) {
    int lo = 0, hi = n - 1, best = 0;
    while (lo < hi) {
        int m = h[lo] < h[hi] ? h[lo] : h[hi];
        if (m * (hi - lo) > best) best = m * (hi - lo);
        if (h[lo] < h[hi]) lo++; else hi--;
    }
    return best;
}

int main(void) {
    int h[] = {1, 8, 6, 2, 5, 4, 8, 3, 7};
    printf("%d\n", max_area(h, 9)); /* 49 */
    return 0;
}
