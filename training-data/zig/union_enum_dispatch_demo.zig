const std = @import("std");

const Shape = union(enum) {
    circle: f64,
    rect: struct { w: f64, h: f64 },
    square: f64,

    fn area(self: Shape) f64 {
        return switch (self) {
            .circle => |r| std.math.pi * r * r,
            .rect => |r| r.w * r.h,
            .square => |s| s * s,
        };
    }
};

pub fn main() void {
    const shapes = [_]Shape{ .{ .circle = 1.5 }, .{ .rect = .{ .w = 2, .h = 3 } }, .{ .square = 4 } };
    for (shapes) |s| {
        std.debug.print("{s}: {d:.3}\n", .{ @tagName(s), s.area() });
    }
}
