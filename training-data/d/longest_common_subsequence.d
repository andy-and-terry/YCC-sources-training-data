import std.stdio;
import std.algorithm : max;

string longestCommonSubsequence(string a, string b) {
    auto m = a.length;
    auto n = b.length;
    auto dp = new int[][](m + 1, n + 1);

    foreach (i; 1 .. m + 1) {
        foreach (j; 1 .. n + 1) {
            if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }

    char[] result;
    size_t i = m, j = n;
    while (i > 0 && j > 0) {
        if (a[i - 1] == b[j - 1]) {
            result ~= a[i - 1];
            i--;
            j--;
        } else if (dp[i - 1][j] > dp[i][j - 1]) {
            i--;
        } else {
            j--;
        }
    }

    import std.algorithm : reverse;
    reverse(result);
    return result.idup;
}

void main() {
    writeln(longestCommonSubsequence("ABCBDAB", "BDCABA"));
}
