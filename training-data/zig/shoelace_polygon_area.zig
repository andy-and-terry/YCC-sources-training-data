const std = @import("std");

const Point = struct { x: f64, y: f64 };

// Shoelace polygon area.
fn area(p: []const Point) f64 {
    var s: f64 = 0;
    for (p, 0..) |a, i| {
        const b = p[(i + 1) % p.len];
        s += a.x * b.y - b.x * a.y;
    }
    return @abs(s) / 2;
}

pub fn main() void {
    const sq = [_]Point{ .{ .x = 0, .y = 0 }, .{ .x = 4, .y = 0 }, .{ .x = 4, .y = 3 }, .{ .x = 0, .y = 3 } };
    std.debug.print("{d}\n", .{area(&sq)});
}
