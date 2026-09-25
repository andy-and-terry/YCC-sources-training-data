#include <stdio.h>

int max_area(const int *h, int n, int *left, int *right) {
    int lo = 0, hi = n - 1, best = 0;
    while (lo < hi) {
        int height = h[lo] < h[hi] ? h[lo] : h[hi];
        int area = (hi - lo) * height;
        if (area > best) {
            best = area;
            *left = lo;
            *right = hi;
        }
        if (h[lo] < h[hi]) lo++;
        else hi--;
    }
    return best;
}

int main(void) {
    int h[] = {1, 8, 6, 2, 5, 4, 8, 3, 7};
    int l = 0, r = 0;
    int a = max_area(h, 9, &l, &r);
    printf("area %d between %d and %d\n", a, l, r);
    return 0;
}
