const std = @import("std");

const Rect = struct {
    w: f32,
    h: f32,
    fn area(self: Rect) f32 { return self.w * self.h; }
};

pub fn main() void {
    const r = Rect{ .w = 2, .h = 3.5 };
    std.debug.print("{d}\n", .{r.area()});
}
