#include <stdio.h>

static unsigned long djb2(const char *s) {
    unsigned long h = 5381;
    int c;
    while ((c = (unsigned char)*s++))
        h = ((h << 5) + h) + c;
    return h;
}

int main(void) {
    printf("%lu\n", djb2("hello"));
    printf("%lu\n", djb2("hello!"));
    printf("%lu bucket of 16\n", djb2("hello") % 16);
    return 0;
}
