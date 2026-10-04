const std = @import("std");

const Color = enum(u8) {
    red = 1,
    green = 2,
    blue = 4,

    fn isWarm(self: Color) bool {
        return self == .red;
    }

    fn next(self: Color) Color {
        return switch (self) {
            .red => .green,
            .green => .blue,
            .blue => .red,
        };
    }
};

pub fn main() void {
    var c = Color.red;
    for (0..4) |_| {
        std.debug.print("{s} value={d} warm={}\n", .{ @tagName(c), @intFromEnum(c), c.isWarm() });
        c = c.next();
    }

    const parsed = std.meta.stringToEnum(Color, "blue");
    std.debug.print("{any}\n", .{parsed});
    std.debug.print("{any}\n", .{std.meta.stringToEnum(Color, "pink")});
    std.debug.print("{d}\n", .{std.meta.fields(Color).len});
}
