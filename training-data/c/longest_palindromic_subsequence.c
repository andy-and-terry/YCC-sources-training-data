#include <stdio.h>
#include <string.h>

/* O(n) memory version keeping one row of the DP table. */
int lps(const char *s) {
    int n = (int)strlen(s);
    int dp[256] = {0};
    if (n == 0 || n > 256) return 0;
    for (int i = n - 1; i >= 0; i--) {
        int prev = 0; /* dp[i+1][j-1] */
        dp[i] = 1;
        for (int j = i + 1; j < n; j++) {
            int tmp = dp[j];
            dp[j] = s[i] == s[j] ? prev + 2 : (dp[j] > dp[j - 1] ? dp[j] : dp[j - 1]);
            prev = tmp;
        }
    }
    return dp[n - 1];
}

int main(void) {
    const char *tests[] = {"bbbab", "character", "agbdba", "racecar"};
    for (int i = 0; i < 4; i++) printf("%s %d\n", tests[i], lps(tests[i]));
    return 0;
}
