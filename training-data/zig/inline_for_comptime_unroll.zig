const std = @import("std");

pub fn main() void {
    const fields = .{ "a", "b", "c" };
    inline for (fields) |f| std.debug.print("{s} ", .{f});
    std.debug.print("\n", .{});
}
