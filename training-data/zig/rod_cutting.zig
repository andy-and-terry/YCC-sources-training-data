const std = @import("std");

// Unbounded rod-cutting: maximize revenue cutting a rod of length n
// given prices[i] = revenue for a piece of length i+1.
fn rodCutting(prices: []const i32, n: usize) i32 {
    var dp: [9]i32 = [_]i32{0} ** 9;
    for (1..n + 1) |len| {
        var best: i32 = 0;
        for (1..len + 1) |cut| {
            const revenue = prices[cut - 1] + dp[len - cut];
            if (revenue > best) best = revenue;
        }
        dp[len] = best;
    }
    return dp[n];
}

pub fn main() void {
    const prices = [_]i32{ 1, 5, 8, 9, 10, 17, 17, 20 };
    std.debug.print("{d}\n", .{rodCutting(&prices, 8)});
    std.debug.print("{d}\n", .{rodCutting(&prices, 4)});
}
