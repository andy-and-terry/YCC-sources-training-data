import std.stdio;
import std.algorithm : max;

int longestIncreasingSubsequence(int[] arr) {
    if (arr.length == 0) return 0;
    auto n = arr.length;
    auto dp = new int[](n);
    dp[] = 1;

    foreach (i; 1 .. n) {
        foreach (j; 0 .. i) {
            if (arr[j] < arr[i]) {
                dp[i] = max(dp[i], dp[j] + 1);
            }
        }
    }

    int best = 0;
    foreach (v; dp) best = max(best, v);
    return best;
}

void main() {
    int[] arr = [10, 9, 2, 5, 3, 7, 101, 18];
    writeln(longestIncreasingSubsequence(arr));
}
