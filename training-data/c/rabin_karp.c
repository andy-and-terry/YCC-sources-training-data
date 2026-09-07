#include <stdio.h>
#include <string.h>

#define BASE 256
#define MOD 101

int rabin_karp(const char *text, const char *pattern) {
    int n = strlen(text), m = strlen(pattern);
    if (m > n) return -1;
    int h = 1;
    for (int i = 0; i < m - 1; i++) h = (h * BASE) % MOD;

    int p_hash = 0, t_hash = 0;
    for (int i = 0; i < m; i++) {
        p_hash = (BASE * p_hash + pattern[i]) % MOD;
        t_hash = (BASE * t_hash + text[i]) % MOD;
    }

    for (int i = 0; i <= n - m; i++) {
        if (p_hash == t_hash) {
            if (strncmp(text + i, pattern, m) == 0) return i;
        }
        if (i < n - m) {
            t_hash = (BASE * (t_hash - text[i] * h) + text[i + m]) % MOD;
            if (t_hash < 0) t_hash += MOD;
        }
    }
    return -1;
}

int main(void) {
    printf("%d\n", rabin_karp("abxabcabcaby", "abcaby"));
    printf("%d\n", rabin_karp("hello world", "notfound"));
    return 0;
}
