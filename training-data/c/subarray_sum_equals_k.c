/* Count contiguous subarrays whose sum equals k (O(n^2) running sums). */
#include <stdio.h>

static int count_subarrays(const int *a, int n, int k) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        int sum = 0;
        for (int j = i; j < n; j++) {
            sum += a[j];
            if (sum == k) count++;
        }
    }
    return count;
}

int main(void) {
    int a[] = {1, 1, 1};
    printf("%d\n", count_subarrays(a, 3, 2));
    return 0;
}
