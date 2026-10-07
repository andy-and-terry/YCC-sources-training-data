#include <stdio.h>
#include <string.h>

/* Greedy wrap: prints text in lines no wider than width. */
void wrap(const char *text, int width) {
    int col = 0;
    const char *p = text;
    while (*p) {
        while (*p == ' ') p++;
        const char *w = p;
        while (*p && *p != ' ') p++;
        int len = (int)(p - w);
        if (len == 0) break;
        if (col > 0 && col + 1 + len > width) {
            printf("%*s|\n", width - col, "");
            col = 0;
        }
        while (len > width) {
            if (col) {
                printf("%*s|\n", width - col, "");
                col = 0;
            }
            printf("%.*s|\n", width, w);
            w += width;
            len -= width;
        }
        if (col > 0) {
            putchar(' ');
            col++;
        }
        printf("%.*s", len, w);
        col += len;
    }
    if (col) printf("%*s|\n", width - col, "");
}

int main(void) {
    wrap("The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically", 16);
    return 0;
}
