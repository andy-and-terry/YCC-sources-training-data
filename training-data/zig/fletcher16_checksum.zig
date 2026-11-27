const std = @import("std");

fn fletcher16(data: []const u8) u16 {
    var s1: u16 = 0;
    var s2: u16 = 0;
    for (data) |b| {
        s1 = (s1 + b) % 255;
        s2 = (s2 + s1) % 255;
    }
    return (s2 << 8) | s1;
}

pub fn main() void {
    std.debug.print("{x}\n", .{fletcher16("abcde")});
}
