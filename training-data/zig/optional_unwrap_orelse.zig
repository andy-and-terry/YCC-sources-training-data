const std = @import("std");
fn find(xs: []const i32, t: i32) ?usize { for (xs, 0..) |x, i| if (x == t) return i; return null; }
pub fn main() void {
    const xs = [_]i32{ 4, 5, 6 };
    std.debug.print("{} {}\n", .{ find(&xs, 5) orelse 99, find(&xs, 9) orelse 99 });
}
