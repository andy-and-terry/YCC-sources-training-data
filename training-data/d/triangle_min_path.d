import std.stdio;
import std.algorithm : min;

int minimumTotal(const int[][] t) {
    auto dp = t[$ - 1].dup;
    foreach_reverse (r; 0 .. t.length - 1)
        foreach (i, v; t[r])
            dp[i] = v + min(dp[i], dp[i + 1]);
    return dp[0];
}

void main() {
    writeln(minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])); // 11
}
