#include <stdio.h>
#include <string.h>

static int bitap(const char *text, const char *pat) {
    unsigned long masks[256] = {0};
    size_t m = strlen(pat);
    for (size_t i = 0; i < m; i++) masks[(unsigned char)pat[i]] |= 1UL << i;
    unsigned long state = 0, goal = 1UL << (m - 1);
    for (size_t i = 0; text[i]; i++) {
        state = ((state << 1) | 1) & masks[(unsigned char)text[i]];
        if (state & goal) return (int)(i - m + 1);
    }
    return -1;
}

int main(void) {
    printf("%d\n", bitap("the quick brown fox", "brown"));
    return 0;
}
