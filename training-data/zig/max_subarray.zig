const std = @import("std");

fn kadane(items: []const i32) i32 {
    var best = items[0];
    var current = items[0];
    for (items[1..]) |x| {
        current = @max(x, current + x);
        best = @max(best, current);
    }
    return best;
}

pub fn main() void {
    const data = [_]i32{ -2, 1, -3, 4, -1, 2, 1, -5, 4 };
    std.debug.print("{d}\n", .{kadane(&data)});
}
