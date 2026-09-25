#include <math.h>
#include <stdio.h>

int jump_search(const int *a, int n, int target) {
    int step = (int)sqrt((double)n);
    if (step < 1) step = 1;
    int prev = 0;
    while (prev < n && a[(prev + step < n ? prev + step : n) - 1] < target) prev += step;
    for (int i = prev; i < prev + step && i < n; i++)
        if (a[i] == target) return i;
    return -1;
}

int main(void) {
    int fib[] = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610};
    int n = sizeof fib / sizeof fib[0];
    printf("%d %d\n", jump_search(fib, n, 55), jump_search(fib, n, 4));
    return 0;
}
