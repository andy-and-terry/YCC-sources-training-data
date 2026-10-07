#include <ctype.h>
#include <stdio.h>
#include <string.h>

static int is_vowel(char c) { return strchr("aeiouAEIOU", c) != NULL; }

void pig_word(const char *w, size_t len, char *out) {
    size_t i = 0;
    while (i < len && !is_vowel(w[i])) i++;
    if (i > 0 && i < len && tolower((unsigned char)w[i - 1]) == 'q' && tolower((unsigned char)w[i]) == 'u') i++;
    if (i == 0) {
        sprintf(out, "%.*sway", (int)len, w);
    } else {
        sprintf(out, "%.*s%.*say", (int)(len - i), w + i, (int)i, w);
    }
}

int main(void) {
    const char *sentence = "the quick brown fox jumps over the lazy dog";
    char out[64];
    for (const char *p = sentence; *p;) {
        while (*p == ' ') p++;
        const char *start = p;
        while (*p && *p != ' ') p++;
        if (p > start) {
            pig_word(start, (size_t)(p - start), out);
            printf("%s ", out);
        }
    }
    printf("\n");
    return 0;
}
