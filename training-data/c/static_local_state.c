#include <stdio.h>

/* A function-local static keeps its value between calls. */
static int next_id(void) {
    static int id = 0;
    return ++id;
}

int main(void) {
    printf("%d %d %d\n", next_id(), next_id(), next_id());
    return 0;
}
