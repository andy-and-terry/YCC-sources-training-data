#include <stdarg.h>
#include <stdio.h>

static int sum(int n, ...) {
    va_list ap;
    va_start(ap, n);
    int t = 0;
    while (n--) t += va_arg(ap, int);
    va_end(ap);
    return t;
}

int main(void) {
    printf("%d\n", sum(4, 1, 2, 3, 4));
    return 0;
}
