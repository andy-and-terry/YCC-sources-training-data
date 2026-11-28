const std = @import("std");

fn chebyshev(a: []const i32, b: []const i32) u32 {
    var m: u32 = 0;
    for (a, b) |x, y| m = @max(m, @abs(x - y));
    return m;
}

pub fn main() void {
    std.debug.print("{d}\n", .{chebyshev(&.{ 1, 2 }, &.{ 4, 6 })});
}
