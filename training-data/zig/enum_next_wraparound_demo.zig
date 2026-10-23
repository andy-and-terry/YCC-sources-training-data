const std = @import("std");

const Light = enum {
    red,
    green,
    yellow,

    fn next(self: Light) Light {
        return switch (self) {
            .red => .green,
            .green => .yellow,
            .yellow => .red,
        };
    }

    fn seconds(self: Light) u32 {
        return switch (self) {
            .red => 30,
            .green => 25,
            .yellow => 5,
        };
    }
};

pub fn main() void {
    var l: Light = .red;
    var total: u32 = 0;
    for (0..6) |_| {
        std.debug.print("{s} for {d}s\n", .{ @tagName(l), l.seconds() });
        total += l.seconds();
        l = l.next();
    }
    std.debug.print("total {d}s\n", .{total});
}
