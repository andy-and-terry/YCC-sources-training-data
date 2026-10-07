#include <stdio.h>
#include <string.h>

void next_term(const char *in, char *out) {
    while (*in) {
        const char *p = in;
        while (*p == *in) p++;
        out += sprintf(out, "%d%c", (int)(p - in), *in);
        in = p;
    }
    *out = '\0';
}

int main(void) {
    char a[256] = "1", b[256];
    for (int i = 0; i < 8; i++) {
        puts(a);
        next_term(a, b);
        strcpy(a, b);
    }
    return 0;
}
