import std.stdio;
import std.algorithm;

int minMultiplications(int[] dims) {
    int n = cast(int) dims.length - 1;
    auto dp = new int[][](n + 1, n + 1);

    foreach (len; 2 .. n + 1) {
        foreach (i; 1 .. n - len + 2) {
            int j = i + len - 1;
            dp[i][j] = int.max;
            foreach (k; i .. j) {
                int cost = dp[i][k] + dp[k + 1][j] + dims[i - 1] * dims[k] * dims[j];
                dp[i][j] = min(dp[i][j], cost);
            }
        }
    }

    return dp[1][n];
}

void main() {
    int[] dims = [40, 20, 30, 10, 30];
    writeln(minMultiplications(dims));
}
