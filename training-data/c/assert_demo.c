#include <stdio.h>
#include <assert.h>

static int divide(int a, int b) {
    assert(b != 0 && "divisor must be non-zero");
    return a / b;
}

int main(void) {
    printf("10/2 = %d\n", divide(10, 2));
    printf("9/3 = %d\n", divide(9, 3));
    /* divide(1, 0) would abort in a build without -DNDEBUG */
    return 0;
}
