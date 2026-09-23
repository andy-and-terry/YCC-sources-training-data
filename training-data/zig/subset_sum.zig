const std = @import("std");

fn subsetSum(nums: []const i32, target: i32) bool {
    const t: usize = @intCast(target);
    var dp: [27]bool = [_]bool{false} ** 27;
    dp[0] = true;
    for (nums) |n| {
        const un: usize = @intCast(n);
        if (un > t) continue;
        var s: usize = t;
        while (s >= un) {
            if (dp[s - un]) dp[s] = true;
            if (s == 0) break;
            s -= 1;
        }
    }
    return dp[t];
}

pub fn main() void {
    const nums = [_]i32{ 3, 34, 4, 12, 5, 2 };
    std.debug.print("{}\n", .{subsetSum(&nums, 9)}); // 3 + 4 + 2
    std.debug.print("{}\n", .{subsetSum(&nums, 1)}); // no single element or sum equals 1
    std.debug.print("{}\n", .{subsetSum(&nums, 26)}); // 3 + 4 + 12 + 5 + 2
}
