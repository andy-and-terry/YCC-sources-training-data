#include <stdio.h>
#include <stdlib.h>

int chebyshev(const int *a, const int *b, int n) {
    int m = 0;
    for (int i = 0; i < n; i++) {
        int d = abs(a[i] - b[i]);
        if (d > m) m = d;
    }
    return m;
}

int main(void) {
    int a[] = {1, 2}, b[] = {4, 6};
    printf("%d\n", chebyshev(a, b, 2));
    return 0;
}
