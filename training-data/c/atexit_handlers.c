#include <stdio.h>
#include <stdlib.h>

static void first(void)  { puts("handler registered first"); }
static void second(void) { puts("handler registered second"); }

int main(void) {
    atexit(first);
    atexit(second);
    puts("main finishing");
    return 0;   /* handlers run in reverse order of registration */
}
