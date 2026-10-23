const std = @import("std");

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    for (0..10) |i| {
        const n: u6 = @intCast(i);
        const v: i64 = @as(i64, n) * (@as(i64, 1) << n) + 1;
        if (i > 0) try out.writeByte(' ');
        try out.print("{d}", .{v});
    }
    try out.writeByte('\n');
}
