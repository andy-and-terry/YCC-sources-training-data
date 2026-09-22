#include <stdio.h>
#include <string.h>

#define MAXN 256

void z_array(const char *s, int n, int z[]) {
    int l = 0, r = 0;
    z[0] = 0;
    for (int i = 1; i < n; i++) {
        z[i] = 0;
        if (i < r) {
            int mirror = z[i - l];
            int remaining = r - i;
            z[i] = mirror < remaining ? mirror : remaining;
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
        if (i + z[i] > r) {
            l = i;
            r = i + z[i];
        }
    }
}

/* Find all occurrences of `pattern` in `text` using the Z-array of
   pattern + '\x01' + text. */
void z_search(const char *pattern, const char *text) {
    char combined[MAXN];
    int plen = (int)strlen(pattern);
    int tlen = (int)strlen(text);
    snprintf(combined, sizeof(combined), "%s\x01%s", pattern, text);
    int n = plen + 1 + tlen;

    int z[MAXN];
    z_array(combined, n, z);

    for (int i = plen + 1; i < n; i++) {
        if (z[i] >= plen) {
            printf("match at text index %d\n", i - plen - 1);
        }
    }
}

int main(void) {
    z_search("aba", "ababcabababc");
    return 0;
}
