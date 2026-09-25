#include <stdbool.h>
#include <stdio.h>

bool pair_with_sum(const int *a, int n, int target, int *oi, int *oj) {
    int i = 0, j = n - 1;
    while (i < j) {
        int s = a[i] + a[j];
        if (s == target) { *oi = i; *oj = j; return true; }
        if (s < target) i++; else j--;
    }
    return false;
}

int main(void) {
    int a[] = {1, 3, 4, 6, 8, 11}, i, j;
    if (pair_with_sum(a, 6, 10, &i, &j)) printf("%d %d\n", i, j);
    printf("%d\n", pair_with_sum(a, 6, 100, &i, &j));
    return 0;
}
