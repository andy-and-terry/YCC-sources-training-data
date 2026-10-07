#include <stdio.h>

static int max(int a, int b) { return a > b ? a : b; }

int rob_range(const int *h, int from, int to) {
    int take = 0, skip = 0;
    for (int i = from; i < to; i++) {
        int t = skip + h[i];
        skip = max(take, skip);
        take = t;
    }
    return max(take, skip);
}

int rob_circle(const int *h, int n) {
    if (n == 1) return h[0];
    return max(rob_range(h, 0, n - 1), rob_range(h, 1, n));
}

int main(void) {
    int a[] = {2, 7, 9, 3, 1}, b[] = {2, 3, 2}, c[] = {1, 2, 3, 1};
    printf("%d %d %d\n", rob_range(a, 0, 5), rob_circle(b, 3), rob_circle(c, 4));
    return 0;
}
