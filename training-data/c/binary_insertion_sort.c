#include <stdio.h>
#include <string.h>

void binary_insertion_sort(int *a, int n) {
    for (int i = 1; i < n; i++) {
        int key = a[i], lo = 0, hi = i;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (a[mid] <= key) lo = mid + 1;
            else hi = mid;
        }
        memmove(a + lo + 1, a + lo, (size_t)(i - lo) * sizeof *a);
        a[lo] = key;
    }
}

int main(void) {
    int a[] = {37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54};
    int n = sizeof a / sizeof a[0];
    binary_insertion_sort(a, n);
    for (int i = 0; i < n; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
