#include <stdio.h>
#include <string.h>

int main(void) {
    const char *s = "abcabc";
    const int k = 3, B = 31, M = 1000003;
    int n = (int)strlen(s), pw = 1;
    for (int i = 1; i < k; i++) pw = pw * B % M;
    long h = 0;
    for (int i = 0; i < k; i++) h = (h * B + s[i]) % M;
    printf("0 %ld\n", h);
    for (int i = 1; i + k <= n; i++) {
        h = (h - s[i - 1] * (long)pw % M + M) % M;
        h = (h * B + s[i + k - 1]) % M;
        printf("%d %ld\n", i, h);
    }
    return 0;
}
