const std = @import("std");

fn minCoins(coins: []const i32, amount: usize) i32 {
    var dp: [12]i32 = undefined;
    dp[0] = 0;
    var n: usize = 1;
    while (n <= amount) : (n += 1) {
        dp[n] = -1;
        for (coins) |c| {
            if (c <= n and dp[n - @as(usize, @intCast(c))] != -1) {
                const candidate = dp[n - @as(usize, @intCast(c))] + 1;
                if (dp[n] == -1 or candidate < dp[n]) {
                    dp[n] = candidate;
                }
            }
        }
    }
    return dp[amount];
}

pub fn main() void {
    const coins = [_]i32{ 1, 2, 5 };
    std.debug.print("{d}\n", .{minCoins(&coins, 11)});
}
