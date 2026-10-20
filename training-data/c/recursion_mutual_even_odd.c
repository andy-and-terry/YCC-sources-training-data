#include <stdio.h>
#include <stdbool.h>

static bool is_odd(unsigned n);
static bool is_even(unsigned n) { return n == 0 ? true : is_odd(n - 1); }
static bool is_odd(unsigned n) { return n == 0 ? false : is_even(n - 1); }

int main(void) {
    printf("%d %d\n", is_even(10), is_odd(7));
    return 0;
}
