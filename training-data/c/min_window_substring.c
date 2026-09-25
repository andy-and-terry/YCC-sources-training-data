#include <limits.h>
#include <stdio.h>
#include <string.h>

/* Writes the minimum window of s containing all chars of t into out. */
void min_window(const char *s, const char *t, char *out) {
    int need[256] = {0};
    int missing = (int)strlen(t), best_l = 0, best_len = INT_MAX;
    for (const char *p = t; *p; p++) need[(unsigned char)*p]++;
    for (int left = 0, right = 0; s[right]; right++) {
        if (need[(unsigned char)s[right]]-- > 0) missing--;
        while (missing == 0) {
            if (right - left + 1 < best_len) {
                best_len = right - left + 1;
                best_l = left;
            }
            if (++need[(unsigned char)s[left++]] > 0) missing++;
        }
    }
    if (best_len == INT_MAX) best_len = 0;
    memcpy(out, s + best_l, (size_t)best_len);
    out[best_len] = '\0';
}

int main(void) {
    char out[64];
    min_window("ADOBECODEBANC", "ABC", out);
    printf("\"%s\"\n", out);
    min_window("a", "aa", out);
    printf("\"%s\"\n", out);
    return 0;
}
