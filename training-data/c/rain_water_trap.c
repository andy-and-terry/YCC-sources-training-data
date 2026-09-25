#include <stdio.h>

int trap(const int *h, int n) {
    int lo = 0, hi = n - 1, left_max = 0, right_max = 0, water = 0;
    while (lo < hi) {
        if (h[lo] < h[hi]) {
            if (h[lo] > left_max) left_max = h[lo];
            water += left_max - h[lo++];
        } else {
            if (h[hi] > right_max) right_max = h[hi];
            water += right_max - h[hi--];
        }
    }
    return water;
}

int main(void) {
    int a[] = {0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1};
    int b[] = {4, 2, 0, 3, 2, 5};
    printf("%d %d\n", trap(a, 12), trap(b, 6));
    return 0;
}
