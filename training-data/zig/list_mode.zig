const std = @import("std");

pub fn main() void {
    const items = [_]u8{ 1, 2, 2, 3, 3, 4 };
    var counts = [_]u32{0} ** 256;
    var top: u32 = 0;
    for (items) |x| {
        counts[x] += 1;
        top = @max(top, counts[x]);
    }
    for (counts, 0..) |c, v| {
        if (c == top and c > 0) std.debug.print("{d} ", .{v});
    }
    std.debug.print("\n", .{});
}
