#include <stdio.h>
#include <string.h>

// Deliberately Foundation-free: this sandbox only has bare clang (no
// Foundation framework), so this uses plain C strings/arrays instead
// of NSString/NSArray.

int maxInt(int a, int b) {
    return a > b ? a : b;
}

int lcsLength(const char *a, const char *b, char *outLcs) {
    int m = (int)strlen(a);
    int n = (int)strlen(b);
    static int dp[64][64];

    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == 0 || j == 0) {
                dp[i][j] = 0;
            } else if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = maxInt(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }

    int len = dp[m][n];
    int idx = len;
    outLcs[idx] = '\0';
    int i = m, j = n;
    while (i > 0 && j > 0) {
        if (a[i - 1] == b[j - 1]) {
            outLcs[--idx] = a[i - 1];
            i--;
            j--;
        } else if (dp[i - 1][j] >= dp[i][j - 1]) {
            i--;
        } else {
            j--;
        }
    }

    return len;
}

int main(void) {
    const char *a = "ABCBDAB";
    const char *b = "BDCABA";
    char lcs[64];

    int len = lcsLength(a, b, lcs);
    printf("LCS length: %d\n", len);
    printf("LCS: %s\n", lcs);
    return 0;
}
