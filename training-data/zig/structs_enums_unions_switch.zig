const std = @import("std");

const Color = enum { red, green, blue };

const Shape = union(enum) {
    circle: f32,
    rect: struct { w: f32, h: f32 },

    fn area(self: Shape) f32 {
        return switch (self) {
            .circle => |r| 3.14159 * r * r,
            .rect => |r| r.w * r.h,
        };
    }
};

const Point = struct {
    x: i32 = 0,
    y: i32 = 0,

    fn add(a: Point, b: Point) Point {
        return .{ .x = a.x + b.x, .y = a.y + b.y };
    }
};

pub fn main() void {
    const c: Color = .green;
    std.debug.print("{s} {d}\n", .{ @tagName(c), @intFromEnum(c) });
    const shapes = [_]Shape{ .{ .circle = 1 }, .{ .rect = .{ .w = 2, .h = 3 } } };
    for (shapes) |s| std.debug.print("{d:.2}\n", .{s.area()});
    const p = Point.add(.{ .x = 1 }, .{ .x = 2, .y = 5 });
    std.debug.print("{d},{d}\n", .{ p.x, p.y });
    const n: u8 = 7;
    const kind = switch (n) {
        0 => "zero",
        1...5 => "small",
        6, 7, 8 => "medium",
        else => "large",
    };
    std.debug.print("{s}\n", .{kind});
}
