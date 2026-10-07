const std = @import("std");

const N = 7;

pub fn main() void {
    var rows: [N][N]u32 = undefined;
    for (0..N) |i| {
        rows[i][0] = 1;
        rows[i][i] = 1;
        var j: usize = 1;
        while (j < i) : (j += 1) {
            rows[i][j] = rows[i - 1][j - 1] + rows[i - 1][j];
        }
    }
    for (0..N) |i| {
        for (rows[i][0 .. i + 1]) |v| {
            std.debug.print("{d} ", .{v});
        }
        std.debug.print("\n", .{});
    }
}
