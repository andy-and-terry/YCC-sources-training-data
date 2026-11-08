const std = @import("std");

pub fn main() void {
    const xs = [_]i32{ 10, 12, 15, 15, 20 };
    var d: [xs.len]i32 = undefined;
    d[0] = xs[0];
    for (1..xs.len) |i| d[i] = xs[i] - xs[i - 1];
    std.debug.print("{any}\n", .{d});
    var acc: i32 = 0;
    for (d) |v| {
        acc += v;
        std.debug.print("{d} ", .{acc});
    }
    std.debug.print("\n", .{});
}
