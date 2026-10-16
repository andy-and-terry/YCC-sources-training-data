#include <stdio.h>

static size_t my_strlen(const char *s) {
    const char *p = s;
    while (*p) p++;
    return (size_t)(p - s);
}

int main(void) {
    printf("%zu\n", my_strlen("hello"));
    printf("%zu\n", my_strlen(""));
    printf("%zu\n", my_strlen("pointer arithmetic"));
    return 0;
}
