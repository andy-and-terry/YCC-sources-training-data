const std = @import("std");

fn run() void {
    defer std.debug.print("defer 1 (runs last)\n", .{});
    defer std.debug.print("defer 2\n", .{});
    {
        defer std.debug.print("inner defer\n", .{});
        std.debug.print("inner block body\n", .{});
    }
    defer std.debug.print("defer 3 (runs first of outer)\n", .{});
    std.debug.print("function body done\n", .{});
}

pub fn main() void {
    run();
}
