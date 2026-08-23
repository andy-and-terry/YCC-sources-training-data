import std.stdio;
import std.algorithm : max;

int knapsack(int[] weights, int[] values, int capacity) {
    int n = cast(int) weights.length;
    auto dp = new int[][](n + 1, capacity + 1);
    foreach (i; 1 .. n + 1) {
        foreach (w; 0 .. capacity + 1) {
            if (weights[i - 1] <= w) {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]);
            } else {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }
    return dp[n][capacity];
}

void main() {
    writeln(knapsack([1, 3, 4, 5], [1, 4, 5, 7], 7));
}
