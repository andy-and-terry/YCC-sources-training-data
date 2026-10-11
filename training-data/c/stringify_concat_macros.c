#include <stdio.h>

#define STR(x) #x
#define CAT(a, b) a##b
#define PRINT_EXPR(e) printf("%s = %d\n", #e, (e))

int main(void) {
    int CAT(val, 1) = 10, CAT(val, 2) = 32;
    PRINT_EXPR(val1 + val2);
    PRINT_EXPR(val1 * val2);
    printf("%s\n", STR(hello world));
    return 0;
}
