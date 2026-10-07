#include <ctype.h>
#include <stdio.h>

void abbreviate(const char *s, char *out) {
    int start = 1;
    for (; *s; s++) {
        unsigned char c = (unsigned char)*s;
        if (isalpha(c)) {
            if (start) *out++ = (char)toupper(c);
            start = 0;
        } else if (c != '\'') {
            start = 1;
        }
    }
    *out = '\0';
}

int main(void) {
    char buf[32];
    abbreviate("Portable Network Graphics", buf);
    puts(buf);
    abbreviate("Complementary metal-oxide semiconductor", buf);
    puts(buf);
    return 0;
}
