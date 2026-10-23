#include <stdio.h>

/* Variadic macros: __VA_ARGS__ forwards any number of arguments, and the
 * ## extension (GNU/Clang/MSVC) swallows the comma when none are given. */
#define LOG(fmt, ...) printf("[log] " fmt "\n", ##__VA_ARGS__)

/* Count up to 5 arguments by sliding them along a fixed parameter list. */
#define COUNT_ARGS_IMPL(_1, _2, _3, _4, _5, N, ...) N
#define COUNT_ARGS(...) COUNT_ARGS_IMPL(__VA_ARGS__, 5, 4, 3, 2, 1, 0)

/* Build an int array literal and take its element count. */
#define SUM(...) sum_ints((int[]){__VA_ARGS__}, \
                          sizeof((int[]){__VA_ARGS__}) / sizeof(int))

static int sum_ints(const int *values, size_t n) {
    int total = 0;
    for (size_t i = 0; i < n; i++) total += values[i];
    return total;
}

int main(void) {
    LOG("no arguments");
    LOG("one argument: %d", 42);
    LOG("two arguments: %s=%d", "x", 7);

    printf("COUNT_ARGS(a) = %d\n", COUNT_ARGS(a));
    printf("COUNT_ARGS(a, b, c) = %d\n", COUNT_ARGS(a, b, c));

    printf("SUM(1, 2, 3, 4) = %d\n", SUM(1, 2, 3, 4));
    printf("SUM(10, 20) = %d\n", SUM(10, 20));
    return 0;
}
