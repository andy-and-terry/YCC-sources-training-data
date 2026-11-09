#include <stdio.h>

#define kind(x) _Generic((x), int: "int", double: "double", char *: "string", default: "other")

int main(void) {
    printf("%s %s %s\n", kind(1), kind(2.5), kind("hi"));
    return 0;
}
