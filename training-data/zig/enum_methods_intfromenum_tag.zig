const std = @import("std");

const Color = enum(u8) {
    red = 1,
    green = 2,
    blue = 4,

    fn isWarm(self: Color) bool {
        return self == .red;
    }
};

pub fn main() void {
    std.debug.print("{} {} {s}\n", .{ @intFromEnum(Color.blue), Color.red.isWarm(), @tagName(Color.green) });
}
