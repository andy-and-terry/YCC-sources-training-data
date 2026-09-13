const std = @import("std");

fn tableHeader(comptime name: []const u8, comptime width: i32) []const u8 {
    return std.fmt.comptimePrint("{s} (width={d})", .{ name, width });
}

pub fn main() void {
    const header = comptime tableHeader("score", 8);
    std.debug.print("{s}\n", .{header});

    const label = comptime std.fmt.comptimePrint("v{d}.{d}.{d}", .{ 1, 4, 2 });
    std.debug.print("{s}\n", .{label});
}
