#include <limits.h>
#include <stdio.h>
#include <string.h>

/* Calls on_match for every occurrence; returns match count. */
int horspool(const char *text, const char *pat, void (*on_match)(size_t)) {
    size_t n = strlen(text), m = strlen(pat);
    size_t shift[UCHAR_MAX + 1];
    int count = 0;
    if (m == 0 || m > n) return 0;
    for (size_t i = 0; i <= UCHAR_MAX; i++) shift[i] = m;
    for (size_t i = 0; i + 1 < m; i++) shift[(unsigned char)pat[i]] = m - 1 - i;
    for (size_t i = 0; i <= n - m; i += shift[(unsigned char)text[i + m - 1]]) {
        if (memcmp(text + i, pat, m) == 0) {
            on_match(i);
            count++;
        }
    }
    return count;
}

static void print_pos(size_t pos) { printf("match at %zu\n", pos); }

int main(void) {
    int c = horspool("here is a simple example, an example indeed", "example", print_pos);
    printf("%d matches\n", c);
    return 0;
}
