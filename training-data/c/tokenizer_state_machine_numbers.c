#include <ctype.h>
#include <stdio.h>

int main(void) {
    const char *s = "x = 12 + y3 * (7 - 42)";
    while (*s) {
        if (isspace((unsigned char)*s)) { s++; continue; }
        if (isdigit((unsigned char)*s)) { int n = 0; while (isdigit((unsigned char)*s)) n = n * 10 + (*s++ - '0'); printf("NUM(%d) ", n); }
        else if (isalpha((unsigned char)*s)) { printf("ID("); while (isalnum((unsigned char)*s)) putchar(*s++); printf(") "); }
        else printf("OP(%c) ", *s++);
    }
    printf("\n");
    return 0;
}
