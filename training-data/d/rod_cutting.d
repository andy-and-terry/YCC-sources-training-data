import std.stdio;
import std.algorithm : max;

int rodCutting(int[] prices, int length) {
    auto dp = new int[length + 1];

    foreach (i; 1 .. length + 1) {
        int best = 0;
        foreach (cut; 1 .. i + 1) {
            best = max(best, prices[cut - 1] + dp[i - cut]);
        }
        dp[i] = best;
    }

    return dp[length];
}

void main() {
    int[] prices = [1, 5, 8, 9, 10, 17, 17, 20];
    writeln(rodCutting(prices, 8));
    writeln(rodCutting(prices, 4));
}
