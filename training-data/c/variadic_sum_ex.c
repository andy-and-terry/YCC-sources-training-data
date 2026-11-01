#include <stdarg.h>
#include <stdio.h>

static int sum(int n, ...) {
    va_list ap;
    va_start(ap, n);
    int s = 0;
    while (n--) s += va_arg(ap, int);
    va_end(ap);
    return s;
}

int main(void) {
    printf("%d\n", sum(4, 1, 2, 3, 4));
    return 0;
}
