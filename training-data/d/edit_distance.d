import std.stdio;
import std.algorithm : min;

int editDistance(string a, string b) {
    auto m = a.length;
    auto n = b.length;
    auto dp = new int[][](m + 1, n + 1);

    foreach (i; 0 .. m + 1) dp[i][0] = cast(int) i;
    foreach (j; 0 .. n + 1) dp[0][j] = cast(int) j;

    foreach (i; 1 .. m + 1) {
        foreach (j; 1 .. n + 1) {
            if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]));
            }
        }
    }

    return dp[m][n];
}

void main() {
    writeln(editDistance("kitten", "sitting"));
}
