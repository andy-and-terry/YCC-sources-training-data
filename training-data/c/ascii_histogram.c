#include <stdio.h>

void histogram(const char *s, int width) {
    int counts[256] = {0}, peak = 0;
    for (const unsigned char *p = (const unsigned char *)s; *p; p++)
        if (++counts[*p] > peak) peak = counts[*p];
    for (int c = 0; c < 256; c++) {
        if (!counts[c]) continue;
        int bar = counts[c] * width / peak;
        printf("%c | ", c);
        for (int i = 0; i < (bar ? bar : 1); i++) putchar('#');
        printf(" %d\n", counts[c]);
    }
}

int main(void) {
    histogram("theraininspainfallsmainlyontheplain", 30);
    return 0;
}
