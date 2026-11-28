#include <stdio.h>

static int equilibrium_index(const int *a, int n) {
    long total = 0, left = 0;
    for (int i = 0; i < n; i++) total += a[i];
    for (int i = 0; i < n; i++) {
        if (left == total - left - a[i]) return i;
        left += a[i];
    }
    return -1;
}

int main(void) {
    int a[] = {1, 7, 3, 6, 5, 6};
    printf("%d\n", equilibrium_index(a, 6)); /* 3 */
    return 0;
}
