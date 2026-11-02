const std = @import("std");

fn find(xs: []const i32, t: i32) ?usize {
    for (xs, 0..) |x, i| if (x == t) return i;
    return null;
}

pub fn main() void {
    const i = find(&.{ 4, 5, 6 }, 9) orelse 999;
    std.debug.print("{}\n", .{i});
}
