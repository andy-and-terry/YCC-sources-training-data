#include <stdio.h>
#include <stdarg.h>

int sum_all(int count, ...) {
    va_list args;
    va_start(args, count);
    int total = 0;
    for (int i = 0; i < count; i++) {
        total += va_arg(args, int);
    }
    va_end(args);
    return total;
}

int main(void) {
    printf("%d\n", sum_all(3, 1, 2, 3));
    printf("%d\n", sum_all(5, 1, 2, 3, 4, 5));
    return 0;
}
