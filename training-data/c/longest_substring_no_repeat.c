#include <stdio.h>
#include <string.h>

int longest_unique(const char *s, int *start_out) {
    int last[256];
    for (int i = 0; i < 256; i++) last[i] = -1;
    int start = 0, best = 0, best_start = 0;
    for (int i = 0; s[i]; i++) {
        unsigned char c = (unsigned char)s[i];
        if (last[c] >= start) start = last[c] + 1;
        last[c] = i;
        if (i - start + 1 > best) {
            best = i - start + 1;
            best_start = start;
        }
    }
    if (start_out) *start_out = best_start;
    return best;
}

int main(void) {
    const char *tests[] = {"abcabcbb", "bbbbb", "pwwkew", "dvdf"};
    for (int i = 0; i < 4; i++) {
        int st, len = longest_unique(tests[i], &st);
        printf("%-10s %.*s (%d)\n", tests[i], len, tests[i] + st, len);
    }
    return 0;
}
