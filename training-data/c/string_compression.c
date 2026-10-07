#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Returns a newly allocated compressed string, or a copy of s if not shorter. */
char *compress(const char *s) {
    size_t n = strlen(s);
    char *out = malloc(2 * n + 1);
    if (!out) return NULL;
    size_t w = 0;
    for (size_t i = 0; i < n;) {
        size_t j = i;
        while (j < n && s[j] == s[i]) j++;
        w += (size_t)sprintf(out + w, "%c%zu", s[i], j - i);
        i = j;
    }
    if (w >= n) strcpy(out, s);
    return out;
}

int main(void) {
    const char *tests[] = {"aabcccccaaa", "abc", "zzzzzzzzzzzz"};
    for (int i = 0; i < 3; i++) {
        char *c = compress(tests[i]);
        printf("%s -> %s\n", tests[i], c);
        free(c);
    }
    return 0;
}
