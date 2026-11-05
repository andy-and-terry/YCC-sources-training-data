#include <stdio.h>

#define TYPE_NAME(x) _Generic((x), \
    int: "int", \
    double: "double", \
    char *: "string", \
    default: "other")

int main(void) {
    printf("%s %s %s\n", TYPE_NAME(1), TYPE_NAME(2.5), TYPE_NAME("hi"));
    return 0;
}
