const std = @import("std");

const Shape = union(enum) {
    circle: f32,
    square: f32,
    rect: f32,

    fn describe(self: Shape) f32 {
        // inline else generates one branch per tag at compile time
        return switch (self) {
            inline else => |value| value * 2.0,
        };
    }
};

pub fn main() void {
    const shapes = [_]Shape{ .{ .circle = 1.5 }, .{ .square = 2.0 }, .{ .rect = 4.0 } };
    for (shapes) |s| {
        std.debug.print("{s}: {d:.1}\n", .{ @tagName(s), s.describe() });
    }
}
