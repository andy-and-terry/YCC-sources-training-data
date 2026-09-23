import std.stdio;

bool subsetSum(int[] nums, int target) {
    auto dp = new bool[target + 1];
    dp[0] = true;
    foreach (num; nums) {
        for (int t = target; t >= num; t--) {
            if (dp[t - num]) dp[t] = true;
        }
    }
    return dp[target];
}

void main() {
    int[] nums = [3, 34, 4, 12, 5, 2];
    writeln(subsetSum(nums, 9)); // true: 4 + 5
    writeln(subsetSum(nums, 1)); // false: no element equals 1
}
