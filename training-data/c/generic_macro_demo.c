#include <stdio.h>

#define abs_generic(x) _Generic((x), \
    int: abs_int, \
    double: abs_double, \
    float: abs_float)(x)

int abs_int(int x) { return x < 0 ? -x : x; }
double abs_double(double x) { return x < 0 ? -x : x; }
float abs_float(float x) { return x < 0 ? -x : x; }

int main(void) {
    printf("%d\n", abs_generic(-5));
    printf("%.1f\n", abs_generic(-3.5));
    printf("%.1f\n", abs_generic(-2.5f));
    return 0;
}
