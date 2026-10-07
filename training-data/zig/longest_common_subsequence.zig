const std = @import("std");

fn longestCommonSubsequence(a: []const u8, b: []const u8) usize {
    var table: [10][10]usize = undefined;
    for (0..a.len + 1) |i| table[i][0] = 0;
    for (0..b.len + 1) |j| table[0][j] = 0;
    for (1..a.len + 1) |i| {
        for (1..b.len + 1) |j| {
            if (a[i - 1] == b[j - 1]) {
                table[i][j] = table[i - 1][j - 1] + 1;
            } else {
                table[i][j] = @max(table[i - 1][j], table[i][j - 1]);
            }
        }
    }
    return table[a.len][b.len];
}

pub fn main() void {
    std.debug.print("{d}\n", .{longestCommonSubsequence("ABCBDAB", "BDCABA")});
    std.debug.print("{d}\n", .{longestCommonSubsequence("abc", "abc")});
}
