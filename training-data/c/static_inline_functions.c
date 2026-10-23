#include <stdio.h>

/* `static inline` is the portable way to define small helper functions in a
 * single file or header: the compiler may expand them at each call site and
 * no external symbol is emitted, so there is no duplicate-definition error. */
static inline int max_int(int a, int b) { return a > b ? a : b; }

static inline int clamp_int(int v, int lo, int hi) {
    return max_int(lo, v < hi ? v : hi);
}

static inline unsigned square(unsigned v) { return v * v; }

/* Unlike a macro, an inline function evaluates its arguments exactly once. */
#define MAX_MACRO(a, b) ((a) > (b) ? (a) : (b))

int main(void) {
    printf("max_int(3, 9) = %d\n", max_int(3, 9));
    printf("clamp_int(150, 0, 100) = %d\n", clamp_int(150, 0, 100));
    printf("clamp_int(-5, 0, 100) = %d\n", clamp_int(-5, 0, 100));
    printf("square(12) = %u\n", square(12));

    int i = 1;
    int via_function = max_int(i++, 0);
    printf("inline: result=%d i=%d\n", via_function, i);

    int j = 1;
    int via_macro = MAX_MACRO(j++, 0); /* j++ is evaluated twice here */
    printf("macro:  result=%d j=%d\n", via_macro, j);
    return 0;
}
