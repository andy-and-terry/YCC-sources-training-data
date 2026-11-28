#include <stdio.h>
#include <stdlib.h>

int manhattan(const int *a, const int *b, int n) {
    int s = 0;
    for (int i = 0; i < n; i++) s += abs(a[i] - b[i]);
    return s;
}

int main(void) {
    int a[] = {1, 2}, b[] = {4, 6};
    printf("%d\n", manhattan(a, b, 2));
    return 0;
}
