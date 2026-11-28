#include <stdio.h>
#include <string.h>

int main(void) {
    const char *s = "banana";
    int n = (int)strlen(s), i = 0;
    while (i < n) {
        int j = i + 1, k = i;
        while (j < n && s[k] <= s[j]) {
            k = (s[k] < s[j]) ? i : k + 1;
            j++;
        }
        int len = j - k;
        while (i <= k) {
            printf("%.*s\n", len, s + i);
            i += len;
        }
    }
    return 0;
}
