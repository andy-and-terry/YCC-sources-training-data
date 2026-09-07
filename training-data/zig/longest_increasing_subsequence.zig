const std = @import("std");

fn lengthOfLIS(nums: []const i32) usize {
    if (nums.len == 0) return 0;
    var dp: [16]usize = undefined;
    for (0..nums.len) |i| dp[i] = 1;
    for (1..nums.len) |i| {
        for (0..i) |j| {
            if (nums[j] < nums[i] and dp[j] + 1 > dp[i]) {
                dp[i] = dp[j] + 1;
            }
        }
    }
    var best: usize = 0;
    for (0..nums.len) |i| best = @max(best, dp[i]);
    return best;
}

pub fn main() void {
    const nums = [_]i32{ 10, 9, 2, 5, 3, 7, 101, 18 };
    std.debug.print("{d}\n", .{lengthOfLIS(&nums)});
}
