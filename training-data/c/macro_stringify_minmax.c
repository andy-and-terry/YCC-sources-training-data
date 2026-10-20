#include <stdio.h>

#define STR(x) #x
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define PRINT_EXPR(e) printf("%s = %d\n", STR(e), (e))

int main(void) {
    int x = 4, y = 9;
    PRINT_EXPR(MAX(x, y));
    PRINT_EXPR(x * y + 1);
    return 0;
}
