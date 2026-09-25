#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *count_and_say(int n) {
    char *s = strdup("1");
    for (int k = 1; k < n; k++) {
        size_t len = strlen(s);
        char *next = malloc(2 * len + 1);
        size_t w = 0;
        for (size_t i = 0; i < len;) {
            size_t j = i;
            while (j < len && s[j] == s[i]) j++;
            next[w++] = (char)('0' + (j - i));
            next[w++] = s[i];
            i = j;
        }
        next[w] = '\0';
        free(s);
        s = next;
    }
    return s;
}

int main(void) {
    for (int i = 1; i <= 10; i++) {
        char *s = count_and_say(i);
        printf("%2d %s\n", i, s);
        free(s);
    }
    return 0;
}
