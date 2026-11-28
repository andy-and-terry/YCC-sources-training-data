const std = @import("std");

pub fn main() void {
    const t = [4][4]u32{
        .{ 2, 0, 0, 0 },
        .{ 3, 4, 0, 0 },
        .{ 6, 5, 7, 0 },
        .{ 4, 1, 8, 3 },
    };
    var dp = t[3];
    var r: usize = 3;
    while (r > 0) {
        r -= 1;
        for (0..r + 1) |i| dp[i] = t[r][i] + @min(dp[i], dp[i + 1]);
    }
    std.debug.print("{d}\n", .{dp[0]}); // 11
}
