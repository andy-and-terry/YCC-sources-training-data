#include <math.h>
#include <stdio.h>

int ternary_search(const int *a, int n, int target) {
    int lo = 0, hi = n - 1;
    while (lo <= hi) {
        int m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
        if (a[m1] == target) return m1;
        if (a[m2] == target) return m2;
        if (target < a[m1]) hi = m1 - 1;
        else if (target > a[m2]) lo = m2 + 1;
        else {
            lo = m1 + 1;
            hi = m2 - 1;
        }
    }
    return -1;
}

double argmax(double (*f)(double), double lo, double hi) {
    for (int i = 0; i < 200; i++) {
        double m1 = lo + (hi - lo) / 3, m2 = hi - (hi - lo) / 3;
        if (f(m1) < f(m2)) lo = m1;
        else hi = m2;
    }
    return (lo + hi) / 2;
}

static double parabola(double x) { return -(x - 2) * (x - 2) + 3; }

int main(void) {
    int a[] = {1, 3, 5, 7, 9, 11, 13};
    printf("%d\n", ternary_search(a, 7, 9));
    printf("%.6f %.6f\n", argmax(parabola, -10, 10), argmax(sin, 0, 3));
    return 0;
}
