const std = @import("std");

pub fn main() void {
    defer std.debug.print("last\n", .{});
    {
        defer std.debug.print("inner\n", .{});
        std.debug.print("first\n", .{});
    }
}
