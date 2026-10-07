const std = @import("std");

const Shape = struct {
    ptr: *anyopaque,
    areaFn: *const fn (ptr: *anyopaque) f64,

    fn area(self: Shape) f64 {
        return self.areaFn(self.ptr);
    }
};

const Circle = struct {
    radius: f64,

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Circle = @ptrCast(@alignCast(ptr));
        return std.math.pi * self.radius * self.radius;
    }

    fn shape(self: *Circle) Shape {
        return .{ .ptr = self, .areaFn = areaImpl };
    }
};

const Rectangle = struct {
    width: f64,
    height: f64,

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Rectangle = @ptrCast(@alignCast(ptr));
        return self.width * self.height;
    }

    fn shape(self: *Rectangle) Shape {
        return .{ .ptr = self, .areaFn = areaImpl };
    }
};

pub fn main() void {
    var circle = Circle{ .radius = 2.0 };
    var rect = Rectangle{ .width = 3.0, .height = 4.0 };
    const shapes = [_]Shape{ circle.shape(), rect.shape() };

    for (shapes) |s| {
        std.debug.print("{d}\n", .{s.area()});
    }
}
