#include <stdio.h>

#define TYPE_NAME(x) _Generic((x), int: "int", double: "double", char: "char", \
                              const char *: "string", default: "other")
#define ABS(x) _Generic((x), int: abs_i, double: abs_d)(x)

static int abs_i(int x) { return x < 0 ? -x : x; }
static double abs_d(double x) { return x < 0 ? -x : x; }

int main(void) {
    printf("%s %s %s %s\n", TYPE_NAME(1), TYPE_NAME(2.0), TYPE_NAME('c'), TYPE_NAME("s"));
    printf("%d %.1f\n", ABS(-3), ABS(-2.5));
    return 0;
}
