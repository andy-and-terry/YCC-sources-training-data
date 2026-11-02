const std = @import("std");

const Vec = struct {
    x: f32,
    y: f32,
    fn len(self: Vec) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

pub fn main() void {
    std.debug.print("{d}\n", .{(Vec{ .x = 3, .y = 4 }).len()});
}
