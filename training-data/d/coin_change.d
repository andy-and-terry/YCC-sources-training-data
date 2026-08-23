import std.stdio;
import std.algorithm : min;

int coinChange(int[] coins, int amount) {
    auto dp = new int[](amount + 1);
    dp[] = amount + 1;
    dp[0] = 0;
    foreach (a; 1 .. amount + 1) {
        foreach (c; coins) {
            if (c <= a) dp[a] = min(dp[a], dp[a - c] + 1);
        }
    }
    return dp[amount] > amount ? -1 : dp[amount];
}

void main() {
    writeln(coinChange([1, 2, 5], 11));
}
