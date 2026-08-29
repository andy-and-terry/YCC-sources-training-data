const std = @import("std");

const Shape = union(enum) {
    circle: f64,
    rectangle: struct { width: f64, height: f64 },
};

fn area(shape: Shape) f64 {
    return switch (shape) {
        .circle => |r| std.math.pi * r * r,
        .rectangle => |rect| rect.width * rect.height,
    };
}

pub fn main() void {
    const c = Shape{ .circle = 4.0 };
    const r = Shape{ .rectangle = .{ .width = 3.0, .height = 5.0 } };
    std.debug.print("{d}\n", .{area(c)});
    std.debug.print("{d}\n", .{area(r)});
}
