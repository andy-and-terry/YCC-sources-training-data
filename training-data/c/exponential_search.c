#include <stdio.h>

static int binary_search(const int *a, int lo, int hi, int target) {
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        if (a[mid] == target) return mid;
        if (a[mid] < target) lo = mid + 1;
        else hi = mid - 1;
    }
    return -1;
}

int exponential_search(const int *a, int n, int target) {
    if (n == 0) return -1;
    if (a[0] == target) return 0;
    int bound = 1;
    while (bound < n && a[bound] < target) bound *= 2;
    return binary_search(a, bound / 2, bound < n - 1 ? bound : n - 1, target);
}

int main(void) {
    int a[67];
    for (int i = 0; i < 67; i++) a[i] = i * 3;
    printf("%d %d\n", exponential_search(a, 67, 99), exponential_search(a, 67, 100));
    return 0;
}
