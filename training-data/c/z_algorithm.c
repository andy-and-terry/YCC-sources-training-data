#include <stdio.h>
#include <string.h>

void compute_z(const char *s, int n, int z[]) {
    int l = 0, r = 0;
    z[0] = 0;
    for (int i = 1; i < n; i++) {
        z[i] = 0;
        if (i < r) {
            int remaining = r - i;
            z[i] = z[i - l] < remaining ? z[i - l] : remaining;
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
        if (i + z[i] > r) {
            l = i;
            r = i + z[i];
        }
    }
}

void z_search(const char *text, const char *pattern) {
    int m = strlen(pattern);
    int n = strlen(text);
    char combined[m + n + 2];
    snprintf(combined, sizeof(combined), "%s$%s", pattern, text);
    int total = m + n + 1;
    int z[total];

    compute_z(combined, total, z);

    for (int i = m + 1; i < total; i++) {
        if (z[i] == m) printf("%d\n", i - m - 1);
    }
}

int main(void) {
    z_search("ababcabcabababd", "ababd");
    z_search("aaaaa", "aa");
    return 0;
}
