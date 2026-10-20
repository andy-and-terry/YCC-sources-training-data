#include <stdio.h>
#include <stddef.h>

static size_t lower_bound(const int *a, size_t n, int key) {
    size_t lo = 0, hi = n;
    while (lo < hi) { size_t mid = lo + (hi - lo) / 2; if (a[mid] < key) lo = mid + 1; else hi = mid; }
    return lo;
}

int main(void) {
    int a[] = {1, 2, 2, 2, 5, 8};
    printf("%zu %zu %zu\n", lower_bound(a, 6, 2), lower_bound(a, 6, 3), lower_bound(a, 6, 9));
    return 0;
}
