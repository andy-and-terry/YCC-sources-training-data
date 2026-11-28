const std = @import("std");

fn area(pts: []const [2]f64) f64 {
    var s: f64 = 0;
    for (pts, 0..) |a, i| {
        const b = pts[(i + 1) % pts.len];
        s += a[0] * b[1] - b[0] * a[1];
    }
    return @abs(s) / 2;
}

pub fn main() void {
    const sq = [_][2]f64{ .{ 0, 0 }, .{ 4, 0 }, .{ 4, 3 }, .{ 0, 3 } };
    std.debug.print("{d}\n", .{area(&sq)});
}
