const std = @import("std");

fn knapsack(weights: []const i32, values: []const i32, capacity: usize) i32 {
    var dp: [6]i32 = [_]i32{0} ** 6;
    for (weights, 0..) |w, i| {
        var cap = capacity;
        while (cap >= @as(usize, @intCast(w))) {
            const withItem = dp[cap - @as(usize, @intCast(w))] + values[i];
            if (withItem > dp[cap]) dp[cap] = withItem;
            if (cap == 0) break;
            cap -= 1;
        }
    }
    return dp[capacity];
}

pub fn main() void {
    const weights = [_]i32{ 2, 3, 4, 5 };
    const values = [_]i32{ 3, 4, 5, 6 };
    std.debug.print("{d}\n", .{knapsack(&weights, &values, 5)});
}
