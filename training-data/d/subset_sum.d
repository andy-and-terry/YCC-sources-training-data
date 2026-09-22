import std.stdio;

bool subsetSum(int[] nums, int target) {
    auto dp = new bool[](target + 1);
    dp[0] = true;
    foreach (num; nums) {
        for (int s = target; s >= num; s--) {
            if (dp[s - num]) dp[s] = true;
        }
    }
    return dp[target];
}

void main() {
    int[] nums = [3, 34, 4, 12, 5, 2];
    writeln(subsetSum(nums, 9));
    writeln(subsetSum(nums, 10));
    writeln(subsetSum(nums, 21));
    writeln(subsetSum(nums, 35));
}
