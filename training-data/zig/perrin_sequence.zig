// Perrin sequence P(n)=P(n-2)+P(n-3)
const std = @import("std");

pub fn main() void {
    var v = [_]i64{ 3, 0, 2, 0, 0, 0, 0, 0, 0, 0 };
    var i: usize = 3;
    while (i < 10) : (i += 1) {
        v[i] = v[i - 2] + v[i - 3];
    }
    for (v) |x| std.debug.print("{d} ", .{x});
    std.debug.print("\n", .{});
}
