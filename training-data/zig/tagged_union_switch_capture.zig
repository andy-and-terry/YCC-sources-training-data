const std = @import("std");

const Shape = union(enum) {
    circle: f64,
    rect: struct { w: f64, h: f64 },
};

fn area(s: Shape) f64 {
    return switch (s) {
        .circle => |r| 3.14159 * r * r,
        .rect => |r| r.w * r.h,
    };
}

pub fn main() void {
    std.debug.print("{d:.2} {d:.2}\n", .{ area(.{ .circle = 1 }), area(.{ .rect = .{ .w = 3, .h = 4 } }) });
}
