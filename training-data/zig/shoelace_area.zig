const std = @import("std");

fn area(xs: []const f64, ys: []const f64) f64 {
    var s: f64 = 0;
    for (0..xs.len) |i| {
        const j = (i + 1) % xs.len;
        s += xs[i] * ys[j] - xs[j] * ys[i];
    }
    return @abs(s) / 2;
}

pub fn main() void {
    std.debug.print("{d}\n", .{area(&.{ 0, 4, 4, 0 }, &.{ 0, 0, 3, 3 })});
}
