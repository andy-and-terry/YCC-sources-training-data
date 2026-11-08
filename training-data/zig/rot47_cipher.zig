const std = @import("std");

fn rot47(buf: []u8) void {
    for (buf) |*c| {
        if (c.* >= 33 and c.* <= 126) c.* = 33 + @as(u8, @intCast((@as(u32, c.*) - 33 + 47) % 94));
    }
}

pub fn main() void {
    var msg = "Hello, World!".*;
    rot47(&msg);
    std.debug.print("{s}\n", .{msg});
    rot47(&msg);
    std.debug.print("{s}\n", .{msg});
}
