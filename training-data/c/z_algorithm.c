#include <stdio.h>
#include <string.h>

#define MAX_LEN 256

void compute_z(const char *s, int z[]) {
    int n = (int)strlen(s);
    int l = 0, r = 0;
    z[0] = n;

    for (int i = 1; i < n; i++) {
        z[i] = 0;
        if (i < r) {
            int remaining = r - i;
            z[i] = (z[i - l] < remaining) ? z[i - l] : remaining;
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
        if (i + z[i] > r) {
            l = i;
            r = i + z[i];
        }
    }
}

void find_occurrences(const char *text, const char *pattern) {
    char combined[MAX_LEN];
    int pattern_len = (int)strlen(pattern);
    snprintf(combined, sizeof(combined), "%s$%s", pattern, text);

    int z[MAX_LEN];
    compute_z(combined, z);

    int total = (int)strlen(combined);
    printf("matches at:");
    for (int i = pattern_len + 1; i < total; i++) {
        if (z[i] == pattern_len) printf(" %d", i - pattern_len - 1);
    }
    printf("\n");
}

int main(void) {
    find_occurrences("abxabcabcaby", "abc");
    find_occurrences("aaaaa", "aa");
    return 0;
}
