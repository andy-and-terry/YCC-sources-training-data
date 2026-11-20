#include <stdio.h>
/* Bead (gravity) sort for small non-negative ints. */
int main(void) {
    int nums[] = {5, 3, 1, 4, 2}, n = 5, cols[5] = {0}, out[5];
    for (int k = 0; k < n; k++) for (int i = 0; i < nums[k]; i++) cols[i]++;
    for (int r = 0; r < n; r++) {
        int c = 0;
        for (int i = 0; i < 5; i++) if (cols[i] > r) c++;
        out[n - 1 - r] = c;
    }
    for (int i = 0; i < n; i++) printf("%d ", out[i]);
    printf("\n");
    return 0;
}
