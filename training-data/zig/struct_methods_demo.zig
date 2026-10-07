const std = @import("std");

const Rect = struct {
    width: f64 = 1.0,
    height: f64 = 1.0,

    const unit = Rect{};

    pub fn init(width: f64, height: f64) Rect {
        return .{ .width = width, .height = height };
    }

    pub fn area(self: Rect) f64 {
        return self.width * self.height;
    }

    pub fn scale(self: *Rect, factor: f64) void {
        self.width *= factor;
        self.height *= factor;
    }

    pub fn isSquare(self: Rect) bool {
        return self.width == self.height;
    }
};

pub fn main() void {
    var r = Rect.init(3, 4);
    std.debug.print("area: {d}\n", .{r.area()});

    r.scale(2);
    std.debug.print("scaled: {d} x {d}\n", .{ r.width, r.height });

    std.debug.print("unit square: {any}\n", .{Rect.unit.isSquare()});

    const partial = Rect{ .width = 5 };
    std.debug.print("{d}\n", .{partial.area()});

    // Method call syntax is sugar for passing the receiver as first arg.
    std.debug.print("{d}\n", .{Rect.area(r)});
}
