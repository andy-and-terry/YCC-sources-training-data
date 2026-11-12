const std = @import("std");
const Color = enum(u8) { red = 1, green = 2, blue = 4,
    fn name(self: Color) []const u8 { return @tagName(self); } };
pub fn main() void { std.debug.print("{s} {}\n", .{ Color.green.name(), @intFromEnum(Color.blue) }); }
