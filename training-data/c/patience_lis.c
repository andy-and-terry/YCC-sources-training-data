#include <stdio.h>

int main(void) {
    int a[] = {10, 9, 2, 5, 3, 7, 101, 18};
    int n = sizeof a / sizeof a[0], tails[8], len = 0;
    for (int i = 0; i < n; i++) {
        int lo = 0, hi = len;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (tails[mid] < a[i]) lo = mid + 1; else hi = mid;
        }
        tails[lo] = a[i];
        if (lo == len) len++;
    }
    printf("%d\n", len);
    return 0;
}
