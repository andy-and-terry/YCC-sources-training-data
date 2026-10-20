#include <stdio.h>
#include <stddef.h>

static void vec_add(size_t n, double *restrict out, const double *restrict a, const double *restrict b) {
    for (size_t i = 0; i < n; i++) out[i] = a[i] + b[i];
}

int main(void) {
    const double a[] = {1, 2, 3}, b[] = {10, 20, 30};
    double o[3];
    vec_add(3, o, a, b);
    printf("%g %g %g\n", o[0], o[1], o[2]);
    return 0;
}
