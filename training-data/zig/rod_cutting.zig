const std = @import("std");

fn rodCutting(prices: []const i32) i32 {
    const n = prices.len;
    var dp = [_]i32{0} ** 32;
    for (1..n + 1) |i| {
        var best: i32 = -1;
        for (1..i + 1) |cut| {
            const candidate = prices[cut - 1] + dp[i - cut];
            if (candidate > best) best = candidate;
        }
        dp[i] = best;
    }
    return dp[n];
}

pub fn main() void {
    const prices = [_]i32{ 1, 5, 8, 9, 10, 17, 17, 20 };
    std.debug.print("{d}\n", .{rodCutting(&prices)});
}
