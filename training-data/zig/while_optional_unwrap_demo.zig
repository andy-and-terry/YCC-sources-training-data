const std = @import("std");

const Countdown = struct {
    n: u32,
    fn next(self: *Countdown) ?u32 {
        if (self.n == 0) return null;
        self.n -= 1;
        return self.n + 1;
    }
};

pub fn main() void {
    var c = Countdown{ .n = 5 };
    while (c.next()) |v| {
        std.debug.print("{d}... ", .{v});
    }
    std.debug.print("liftoff\n", .{});
}
