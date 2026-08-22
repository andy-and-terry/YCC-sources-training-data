const std = @import("std");

const Point = struct {
    x: f64,
    y: f64,

    fn add(self: Point, other: Point) Point {
        return Point{ .x = self.x + other.x, .y = self.y + other.y };
    }
};

pub fn main() void {
    const p1 = Point{ .x = 1.0, .y = 2.0 };
    const p2 = Point{ .x = 3.0, .y = 4.0 };
    const p3 = p1.add(p2);
    std.debug.print("({d}, {d})\n", .{ p3.x, p3.y });
}
