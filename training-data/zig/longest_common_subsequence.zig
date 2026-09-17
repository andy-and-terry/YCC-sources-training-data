const std = @import("std");
const allocator = std.heap.page_allocator;

fn lcsLength(a: []const u8, b: []const u8) !usize {
    const rows = a.len + 1;
    const cols = b.len + 1;

    const dp = try allocator.alloc([]usize, rows);
    defer allocator.free(dp);
    for (dp) |*row| {
        row.* = try allocator.alloc(usize, cols);
    }
    defer for (dp) |row| allocator.free(row);

    for (0..rows) |i| dp[i][0] = 0;
    for (0..cols) |j| dp[0][j] = 0;

    for (1..rows) |i| {
        for (1..cols) |j| {
            if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
            } else {
                dp[i][j] = @max(dp[i - 1][j], dp[i][j - 1]);
            }
        }
    }
    return dp[rows - 1][cols - 1];
}

pub fn main() !void {
    const len = try lcsLength("ABCBDAB", "BDCABA");
    std.debug.print("{d}\n", .{len});
}
