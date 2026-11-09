const std = @import("std");

pub fn main() void {
    var x: ?i32 = null;
    std.debug.print("{d}\n", .{x orelse -1});
    x = 5;
    if (x) |v| std.debug.print("got {d}\n", .{v});
}
