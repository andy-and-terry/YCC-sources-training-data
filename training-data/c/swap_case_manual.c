#include <ctype.h>
#include <stdio.h>

static void swap_case(char *s) {
    for (; *s; s++)
        *s = isupper((unsigned char)*s) ? tolower((unsigned char)*s) : toupper((unsigned char)*s);
}

int main(void) {
    char text[] = "Hello World 42";
    swap_case(text);
    puts(text);
    return 0;
}
