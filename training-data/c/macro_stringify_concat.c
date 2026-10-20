#include <stdio.h>

#define STR(x) #x
#define XSTR(x) STR(x)
#define CAT(a, b) a##b
#define SQUARE(x) ((x) * (x))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define VERSION 3

int main(void) {
    int CAT(val, 1) = 5;
    printf("%s %s %d\n", STR(hello world), XSTR(VERSION), val1);
    printf("%d %d\n", SQUARE(2 + 3), MAX(4, 9));
    printf("%s:%d\n", __FILE__ + 0 * 1, __LINE__);
    return 0;
}
