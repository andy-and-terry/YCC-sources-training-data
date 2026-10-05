const std = @import("std");

const Color = enum(u8) {
    red = 1,
    green = 2,
    blue = 4,

    fn isWarm(self: Color) bool {
        return self == .red;
    }

    fn name(self: Color) []const u8 {
        return @tagName(self);
    }
};

pub fn main() void {
    const c = Color.green;
    std.debug.print("{s} = {d}\n", .{ c.name(), @intFromEnum(c) });
    std.debug.print("warm: {any}\n", .{Color.red.isWarm()});

    const from_int: Color = @enumFromInt(4);
    std.debug.print("{s}\n", .{from_int.name()});

    inline for (std.meta.fields(Color)) |f| {
        std.debug.print("{s} -> {d}\n", .{ f.name, f.value });
    }
    std.debug.print("parsed: {any}\n", .{std.meta.stringToEnum(Color, "blue")});
}
