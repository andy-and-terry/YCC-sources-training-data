const std = @import("std");

const Point = struct {
    x: i32,
    y: i32,

    pub fn sum(self: Point) i32 {
        return self.x + self.y;
    }
};

pub fn main() void {
    std.debug.print("has x: {}\n", .{@hasField(Point, "x")});
    std.debug.print("has z: {}\n", .{@hasField(Point, "z")});
    std.debug.print("has sum: {}\n", .{@hasDecl(Point, "sum")});

    const p = Point{ .x = 3, .y = 4 };
    std.debug.print("field y via @field: {d}\n", .{@field(p, "y")});
}
