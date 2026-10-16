const std = @import("std");

pub fn main() void {
    var buf: [32]u8 = undefined;
    const src = "Hello, Zig World";
    const up = std.ascii.upperString(&buf, src);
    std.debug.print("{s}\n", .{up});
    const low = std.ascii.lowerString(&buf, src);
    std.debug.print("{s}\n", .{low});
    std.debug.print("eqlIgnoreCase: {}\n", .{std.ascii.eqlIgnoreCase("ZIG", "zig")});
    std.debug.print("toUpper('q') = {c}\n", .{std.ascii.toUpper('q')});
}
