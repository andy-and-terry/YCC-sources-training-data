const std = @import("std");

// Manhattan distance of two integer vectors.
fn manhattan(a: []const i32, b: []const i32) u32 {
    var s: u32 = 0;
    for (a, b) |x, y| s += @abs(x - y);
    return s;
}

pub fn main() void {
    std.debug.print("{d}\n", .{manhattan(&.{ 1, 2 }, &.{ 4, 6 })});
}
