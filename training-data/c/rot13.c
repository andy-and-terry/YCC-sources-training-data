#include <stdio.h>

/* Filter: reads stdin if given "-", otherwise transforms a built-in sample. */
static int rot13_char(int c) {
    if (c >= 'a' && c <= 'z') return 'a' + (c - 'a' + 13) % 26;
    if (c >= 'A' && c <= 'Z') return 'A' + (c - 'A' + 13) % 26;
    return c;
}

int main(int argc, char **argv) {
    if (argc > 1 && argv[1][0] == '-') {
        int c;
        while ((c = getchar()) != EOF) putchar(rot13_char(c));
        return 0;
    }
    const char *sample = "Why did the chicken cross the road?";
    for (const char *p = sample; *p; p++) putchar(rot13_char(*p));
    putchar('\n');
    return 0;
}
