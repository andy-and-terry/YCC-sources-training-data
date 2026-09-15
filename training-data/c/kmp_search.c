#include <stdio.h>
#include <string.h>

void compute_lps(const char *pattern, int m, int *lps) {
    int len = 0;
    lps[0] = 0;
    int i = 1;
    while (i < m) {
        if (pattern[i] == pattern[len]) {
            len++;
            lps[i] = len;
            i++;
        } else if (len != 0) {
            len = lps[len - 1];
        } else {
            lps[i] = 0;
            i++;
        }
    }
}

int kmp_search(const char *text, const char *pattern) {
    int n = (int)strlen(text);
    int m = (int)strlen(pattern);
    if (m == 0) return 0;
    int lps[m];
    compute_lps(pattern, m, lps);

    int i = 0, j = 0;
    while (i < n) {
        if (text[i] == pattern[j]) {
            i++;
            j++;
            if (j == m) {
                return i - j;
            }
        } else if (j != 0) {
            j = lps[j - 1];
        } else {
            i++;
        }
    }
    return -1;
}

int main(void) {
    printf("%d\n", kmp_search("abxabcabcaby", "abcaby"));
    printf("%d\n", kmp_search("hello world", "world"));
    printf("%d\n", kmp_search("hello world", "xyz"));
    return 0;
}
