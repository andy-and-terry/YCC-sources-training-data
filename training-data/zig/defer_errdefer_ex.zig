const std = @import("std");

fn work(fail: bool) !void {
    defer std.debug.print("cleanup\n", .{});
    errdefer std.debug.print("rolling back\n", .{});
    if (fail) return error.Boom;
    std.debug.print("ok\n", .{});
}

pub fn main() void {
    work(false) catch {};
    work(true) catch |e| std.debug.print("caught {s}\n", .{@errorName(e)});
}
