const std = @import("std");

fn centralDelannoy(comptime n: usize) u64 {
    var g: [n + 1][n + 1]u64 = undefined;
    for (0..n + 1) |i| {
        for (0..n + 1) |j| {
            g[i][j] = if (i == 0 or j == 0) 1 else g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
        }
    }
    return g[n][n];
}

pub fn main() void {
    std.debug.print("{d} {d} {d} {d} {d} {d}\n", .{
        centralDelannoy(0), centralDelannoy(1), centralDelannoy(2),
        centralDelannoy(3), centralDelannoy(4), centralDelannoy(5),
    }); // 1 3 13 63 321 1683
}
