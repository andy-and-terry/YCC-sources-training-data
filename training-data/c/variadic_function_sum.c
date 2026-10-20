#include <stdarg.h>
#include <stdio.h>

static double avg(int n, ...) {
    va_list ap;
    double s = 0;
    va_start(ap, n);
    for (int i = 0; i < n; i++) s += va_arg(ap, double);
    va_end(ap);
    return n ? s / n : 0;
}

int main(void) {
    printf("%.2f\n", avg(3, 1.0, 2.0, 4.5));
    return 0;
}
