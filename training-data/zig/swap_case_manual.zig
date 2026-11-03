const std = @import("std");

fn swapCase(buf: []u8) void {
    for (buf) |*c| {
        c.* = if (std.ascii.isUpper(c.*)) std.ascii.toLower(c.*) else std.ascii.toUpper(c.*);
    }
}

pub fn main() void {
    var text = "Hello World 42".*;
    swapCase(&text);
    std.debug.print("{s}\n", .{text});
}
