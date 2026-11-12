const std = @import("std");
const P = struct {
    x: i32, y: i32,
    fn init(x: i32, y: i32) P { return .{ .x = x, .y = y }; }
    fn sum(self: P) i32 { return self.x + self.y; }
};
pub fn main() void { std.debug.print("{}\n", .{P.init(3, 4).sum()}); }
