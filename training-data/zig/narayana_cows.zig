// Narayana's cows N(n)=N(n-1)+N(n-3)
const std = @import("std");

pub fn main() void {
    var v = [_]i64{ 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 };
    var i: usize = 3;
    while (i < 10) : (i += 1) {
        v[i] = v[i - 1] + v[i - 3];
    }
    for (v) |x| std.debug.print("{d} ", .{x});
    std.debug.print("\n", .{});
}
