#include <stdarg.h>
#include <stdio.h>

static int sum(int count, ...) {
    va_list ap;
    va_start(ap, count);
    int total = 0;
    for (int i = 0; i < count; i++) total += va_arg(ap, int);
    va_end(ap);
    return total;
}

int main(void) {
    printf("%d %d\n", sum(3, 1, 2, 3), sum(1, 42));
    return 0;
}
