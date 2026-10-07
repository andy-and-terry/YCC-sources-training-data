#include <stdio.h>
#include <string.h>

/* Writes the longest common prefix into out (capacity cap); returns its length. */
size_t longest_common_prefix(const char **words, size_t count, char *out, size_t cap) {
    if (count == 0) {
        if (cap) out[0] = '\0';
        return 0;
    }
    size_t len = strlen(words[0]);
    for (size_t w = 1; w < count; w++) {
        size_t i = 0;
        while (i < len && words[w][i] && words[w][i] == words[0][i]) i++;
        len = i;
    }
    if (len >= cap) len = cap - 1;
    memcpy(out, words[0], len);
    out[len] = '\0';
    return len;
}

int main(void) {
    const char *a[] = {"flower", "flow", "flight"};
    const char *b[] = {"dog", "racecar", "car"};
    char buf[64];
    longest_common_prefix(a, 3, buf, sizeof buf);
    printf("\"%s\"\n", buf);
    longest_common_prefix(b, 3, buf, sizeof buf);
    printf("\"%s\"\n", buf);
    return 0;
}
